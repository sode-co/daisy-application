/* groovylint-disable UnnecessaryGString */
/* groovylint-disable-next-line LineLength */
/* groovylint-disable CompileStatic, DuplicateStringLiteral, NestedBlockDepth, NoDef, VariableName, VariableTypeRequired */
/* groovylint-disable-next-line NoDef, VariableName, VariableTypeRequired */
final APPSETTINGS_FILE_PATH = '/var/jenkins_home/workspace/var-environment-all/daisy-appsettings.json'
def _WEB_GRPC_PORT
def _MOBILE_GRPC_PORT
def _API_PORT
def _WEB_APP_PORT
def _TARGET_BRANCH
def _SUB_NAME
def _ENV
def _HOST="161.35.98.184"

pipeline {
  agent any
  triggers {
      // check every minutes
      pollSCM('* * * * *')
  }
  environment {
    GIT_COMMIT_SHORT = ''
  }
  options {
    disableConcurrentBuilds()
    buildDiscarder logRotator(
      artifactDaysToKeepStr: '',
      artifactNumToKeepStr: '5',
      daysToKeepStr: '',
      numToKeepStr: '5'
    )
  }
  stages {
    stage('Parameterize') {
      steps {
        script {
          properties([parameters([
            string(name: 'WEB_GRPC_PORT', trim: true),
            string(name: 'MOBILE_GRPC_PORT', trim: true),
            string(name: 'API_PORT', trim: true),
            string(name: 'WEB_APP_PORT', trim: true)
          ])])
        }
      }
    }
    stage('Checking out') {
      steps {
        script {
          def repo = checkout scm
          dir('daisy-application') {
            GIT_COMMIT_SHORT = sh(
              script: "printf \$(git rev-parse --short ${repo.GIT_COMMIT})",
              returnStdout: true)
          }

          _TARGET_BRANCH = env.BRANCH_NAME
          if (_TARGET_BRANCH == "main") {
            println 'Current branch is main switch to production environment'
            _ENV = 'production'
          }
          else {
            println "Current branch is ${_TARGET_BRANCH} switch to test environment"
            _ENV = 'test'
          }

          println "Checked out the branch ${_TARGET_BRANCH}"
          println "Git commit short hash: ${GIT_COMMIT_SHORT}"
        }
      }
    }
    stage('Setup environment') {
      steps {
        script {
          if (_TARGET_BRANCH == null || _TARGET_BRANCH == 'main') {
            _WEB_APP_PORT = 80
            _API_PORT = 2433
            _WEB_GRPC_PORT = 50052
            _MOBILE_GRPC_PORT = 50152
          }
          else if (_TARGET_BRANCH == 'test') {
            _WEB_APP_PORT = 8091
            _API_PORT = 2443
            _WEB_GRPC_PORT = 50062
            _MOBILE_GRPC_PORT = 50162
          }
          else {
            _WEB_GRPC_PORT = WEB_GRPC_PORT
            _MOBILE_GRPC_PORT = MOBILE_GRPC_PORT
            _API_PORT = API_PORT
            _WEB_APP_PORT = WEB_APP_PORT
          }

          _SUB_NAME = "${_TARGET_BRANCH}_${GIT_COMMIT_SHORT}"

          dir('./') {
            sh """
              mkdir -p pipeline/env
              mkdir -p daisy-core-services/Shared
              cp ${APPSETTINGS_FILE_PATH} pipeline/env/appsettings.json
              cp ${APPSETTINGS_FILE_PATH} daisy-core-services/Shared/appsettings.json
              cp ${APPSETTINGS_FILE_PATH} daisy-core-services/DataAccess/appsettings.json
            """
          }

          println "BUILD VARIABLES"
          println "==================================="
          println "WEB_APP_PORT: ${_WEB_APP_PORT}"
          println "API_PORT: ${_API_PORT}"
          println "WEB_GRPC_PORT: ${_WEB_GRPC_PORT}"
          println "MOBILE_GRPC_PORT: ${_MOBILE_GRPC_PORT}"
          println "SUB_NAME: ${_SUB_NAME}"
          println "==================================="

          if (!(_WEB_APP_PORT?.toString().trim() &&
                _API_PORT?.toString().trim() &&
                _WEB_GRPC_PORT?.toString().trim() &&
                _MOBILE_GRPC_PORT?.toString().trim())) {

            println 'Skipping pipeline due to not found any parameters'
            currentBuild.currentResult = 'SUCCESS'
            return
          }
        }
      }
    }
    stage('Build Api Image') {
      steps {
        script {
          dir('./') {
            println "Building grpc image with name: tiendvlp/daisy_api:${_SUB_NAME}"
            sh """
              docker build --no-cache -f pipeline/Api.Dockerfile -t tiendvlp/daisy_api:${_SUB_NAME} .
            """
          }
        }
      }
    }
    stage('Build gRPC Image') {
      steps {
        script {
          dir('./') {
            println "Building grpc image with name: tiendvlp/daisy_grpc:${_SUB_NAME}"
            sh """
              docker build --no-cache -f pipeline/gRPC.Dockerfile -t tiendvlp/daisy_grpc:${_SUB_NAME} .
            """
          }
        }
      }
    }
    stage('Build Flutter Web Image') {
      steps {
        script {
          dir('./') {
            println "Building flutter image with name: tiendvlp/daisy_flutter_web:${_SUB_NAME}"
            sh """
              docker build --no-cache \
                -f pipeline/FlutterWeb.Dockerfile \
                --build-arg ENVIRONMENT='${_ENV}' \
                --build-arg API_HOST=${_HOST} \
                --build-arg API_PORT=${_API_PORT} \
                --build-arg GRPC_HOST=${_HOST} \
                --build-arg MOBILE_GRPC_PORT=${_MOBILE_GRPC_PORT} \
                --build-arg GRPC_PORT=${_WEB_GRPC_PORT} \
                --build-arg WEB_URL=http://slimair.cool:${_WEB_APP_PORT} \
                -t tiendvlp/daisy_flutter_web:${_SUB_NAME} .
            """
          }
        }
      }
    }
    stage('Setting up network') {
      steps {
          sh """
            docker network create DaisyInternal || echo 'skipping error...'
            docker network connect DaisyInternal jenkins || echo 'skipping error...'
            docker network connect DaisyInternal mssqlserver || echo 'skipping error...'
          """
      }
    }
    stage('Database Migration') {
      steps {
         dir('daisy-core-services') {
          sh """
            export ASPNETCORE_ENVIRONMENT=${_ENV}
            export PATH="$PATH:/root/.dotnet/tools"
            dotnet ef database update --startup-project DataAccess
          """
         }
      }
    }
    stage('Push to DockerHub') {
      steps {
        script {
          if (_ENV == 'production') {
            // println "Pushing tiendvlp/daisy_api:${_SUB_NAME}..."
            // sh """
            //   docker push tiendvlp/daisy_api:${_SUB_NAME}
            // """
            // println "Pushed tiendvlp/daisy_api:${_SUB_NAME} into docker hub successfully"

            // println "Pushing tiendvlp/daisy_grpc:${_SUB_NAME}..."
            // sh """
            //   docker push tiendvlp/daisy_grpc:${_SUB_NAME}
            // """
            // println "Pushed tiendvlp/daisy_grpc:${_SUB_NAME} into docker hub successfully"

            // println "Pushing tiendvlp/daisy_flutter_web:${_SUB_NAME}..."
            // sh """
            //   docker push tiendvlp/daisy_flutter_web:${_SUB_NAME}
            // """
            // /* groovylint-disable-next-line LineLength */
            // println "Pushed tiendvlp/daisy_flutter_web:${_SUB_NAME} into docker hub successfully"

            // println "All services has been pushed into docker hub with tag ${_SUB_NAME}"
          }
        }
      }
    }
    stage('Pre-Launch Prepare') {
      steps {
        script {
          if (_ENV != 'production' && _ENV != 'test') {
            println 'Not Product or Test env, Let cleaning up current running container...'
            sh """
              docker stop daisy_api_${_TARGET_BRANCH} || \
              echo 'skipping error while stopping daisy_api_${_TARGET_BRANCH}...'
            """

            sh """
              docker stop daisy_grpc_web_${_TARGET_BRANCH} || \
              echo 'skipping error while stopping daisy_grpc_web_${_TARGET_BRANCH}...'
            """

            sh """
              docker stop daisy_flutter_web_${_TARGET_BRANCH} || \
              echo 'skipping error while stopping daisy_flutter_web_${_TARGET_BRANCH}...'
            """

            sh """
              docker stop daisy_grpc_mobile_${_TARGET_BRANCH} || \
              echo 'skipping error while stopping daisy_grpc_mobile_${_TARGET_BRANCH}...'
            """
          }
          else {
            println "Detect ${_ENV} environment, skipping..."
          }
        }
      }
    }
    stage('Launch Api') {
      steps {
        script {
          def containerName = "daisy_api_${_TARGET_BRANCH}"
          println "Stopping ${containerName}..."
          sh "docker stop ${containerName} || echo 'skipping error while stopping ${containerName}...'"

          println "Running ${containerName}..."
          sh """
            docker run -d \
              -p ${_API_PORT}:2433 \
              --rm --network DaisyInternal \
              -e ASPNETCORE_ENVIRONMENT=${_ENV} \
              --name ${containerName} tiendvlp/daisy_api:${_SUB_NAME}
          """
        }
      }
    }
    stage('Launch gRPC Web') {
      steps {
        script {
          def containerName = "daisy_grpc_web_${_TARGET_BRANCH}"
          println "Stopping ${containerName}..."
          sh "docker stop ${containerName} || echo 'skipping error while stopping ${containerName}...'"

          println "Running ${containerName}"
          sh """
            docker run -d --rm -p ${_WEB_GRPC_PORT}:50052 \
              --network DaisyInternal \
              --name ${containerName} \
              -e ASPNETCORE_ENVIRONMENT=${_ENV} \
              -it tiendvlp/daisy_grpc:${_SUB_NAME} GrpcServices.dll
          """
        }
      }
    }
    stage('Launch gRPC Mobile') {
      steps {
        script {
          def containerName = "daisy_grpc_mobile_${_TARGET_BRANCH}"
          println "Stopping ${containerName}..."
          sh "docker stop ${containerName} || echo 'skipping error while stopping ${containerName}...'"

          println "Running ${containerName}..."
          sh """
            docker run -d --rm -p ${_MOBILE_GRPC_PORT}:50152 \
              --network DaisyInternal \
              --name ${containerName} \
              -e ASPNETCORE_ENVIRONMENT=${_ENV} \
              -it tiendvlp/daisy_grpc:${_SUB_NAME} MobileGrpcServices.dll
          """
        }
      }
    }
    stage('Launch Web') {
      steps {
        script {
          def containerName = "daisy_flutter_web_${_TARGET_BRANCH}"
          println "Stopping ${containerName}..."
          sh "docker stop ${containerName} || echo 'skipping error while stopping ${containerName}...'"

          println "Running ${containerName}..."
          sh """
            docker run -d --rm -p ${_WEB_APP_PORT}:8081 \
              --network DaisyInternal \
              --name ${containerName} \
              tiendvlp/daisy_flutter_web:${_SUB_NAME}
          """
        }
      }
    }
    stage('Clean Up') {
      steps {
        script {
          println 'Cleaning up stopped docker contaner...'
          sh 'docker container prune -f'

          println 'Cleaning up unused docker images...'
          sh 'docker image prune -af'

          println 'Cleaning up unused docker network...'
          sh 'docker network prune -f'

          println 'Clean up success.'
        }
      }
    }
  }
}
