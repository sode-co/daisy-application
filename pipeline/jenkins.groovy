/* groovylint-disable-next-line LineLength */
/* groovylint-disable CompileStatic, DuplicateStringLiteral, NestedBlockDepth, NoDef, VariableName, VariableTypeRequired */
/* groovylint-disable-next-line NoDef, VariableName, VariableTypeRequired */
final APPSETTINGS_FILE_PATH = '/var/jenkins_home/workspace/var-environment-all/daisy-appsettings.json'
def _WEB_GRPC_PORT
def _MOBILE_GRPC_PORT
def _API_PORT
def _WEB_APP_PORT
def _TARGET_BRANCH

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
          echo "Checked out the branch ${_TARGET_BRANCH}"
          echo "Git commit short hash: ${GIT_COMMIT_SHORT}"
        }
      }
    }
    stage('Setup environment') {
      steps {
        script {
          if (_TARGET_BRANCH == null || _TARGET_BRANCH == 'main') {
            _WEB_APP_PORT = 8081
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

          dir('./') {
            sh """
              mkdir -p pipeline/env
              mkdir -p daisy-core-services/Shared
              cp ${APPSETTINGS_FILE_PATH} pipeline/env/appsettings.json
              cp ${APPSETTINGS_FILE_PATH} daisy-core-services/Shared/appsettings.json
            """
          }

          sh """
            echo 'BUILD VARIABLES'
            echo '==================================='
            echo 'WEB_APP_PORT: ${_WEB_APP_PORT}'
            echo 'API_PORT: ${_API_PORT}'
            echo 'WEB_GRPC_PORT: ${_WEB_GRPC_PORT}'
            echo 'MOBILE_GRPC_PORT: ${_MOBILE_GRPC_PORT}'
            echo '==================================='
          """
        }
      }
    }
    stage('Build Api Image') {
      steps {
        script {
          dir('./') {
            sh """
              docker build --no-cache -f pipeline/Api.Dockerfile -t tiendvlp/daisy_api:${GIT_COMMIT_SHORT} .
              docker build --no-cache -f pipeline/Api.Dockerfile -t tiendvlp/daisy_api:latest .
            """
          }
        }
      }
    }
    stage('Build gRPC Image') {
      steps {
        script {
          dir('./') {
            sh """
              docker build --no-cache -f pipeline/gRPC.Dockerfile -t tiendvlp/daisy_grpc:${GIT_COMMIT_SHORT} .
              docker build --no-cache -f pipeline/gRPC.Dockerfile -t tiendvlp/daisy_grpc:latest .
            """
          }
        }
      }
    }
    stage('Build Flutter Web Image') {
      steps {
        script {
          dir('./') {
            sh """
              docker build --no-cache \
              -f pipeline/FlutterWeb.Dockerfile \
              -t tiendvlp/daisy_flutter_web:${GIT_COMMIT_SHORT} .
              docker build --no-cache -f pipeline/FlutterWeb.Dockerfile -t tiendvlp/daisy_flutter_web:latest .
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
          sh 'dotnet ef database update --startup-project DataAccess'
         }
      }
    }
    stage('Push to DockerHub') {
      steps {
        script {
          if (_TARGET_BRANCH == main) {
            sh """
              echo 'Pushing tiendvlp/daisy_api:${GIT_COMMIT_SHORT}...'
              docker push tiendvlp/daisy_api:${GIT_COMMIT_SHORT}
              docker push tiendvlp/daisy_api:latest

              echo 'Pushed tiendvlp/daisy_api:${GIT_COMMIT_SHORT} into docker hub successfully'
              echo 'Pushing tiendvlp/daisy_grpc:${GIT_COMMIT_SHORT}...'
              docker push tiendvlp/daisy_grpc:${GIT_COMMIT_SHORT}

              docker push tiendvlp/daisy_grpc:latest
              echo 'Pushed tiendvlp/daisy_grpc:${GIT_COMMIT_SHORT} into docker hub successfully'
              echo 'Pushing tiendvlp/daisy_flutter_web:${GIT_COMMIT_SHORT}...'

              docker push tiendvlp/daisy_flutter_web:${GIT_COMMIT_SHORT}
              docker push tiendvlp/daisy_flutter_web:latest
              echo 'Pushed tiendvlp/daisy_flutter_web:${GIT_COMMIT_SHORT} into docker hub successfully'

              echo 'All services has been pushed into docker hub with tag ${GIT_COMMIT_SHORT}'

              echo 'Cleaning up image...'
              docker image rm tiendvlp/daisy_api:${GIT_COMMIT_SHORT}
              docker image rm tiendvlp/daisy_grpc:${GIT_COMMIT_SHORT}
              docker image rm tiendvlp/daisy_flutter_web:${GIT_COMMIT_SHORT}
            """
          }
        }
      }
    }
    stage('Launch Api') {
      steps {
        sh """
          echo 'Stopping daisy-api...'
          docker stop daisy-api || echo 'skipping error...'
          echo 'Running daisy-api...'
          docker run -d \
            -p ${_API_PORT}:2433 \
            --rm --network DaisyInternal \
            --name daisy-api tiendvlp/daisy_api:latest
        """
      }
    }
    stage('Launch gRPC Web') {
      steps {
        sh """
          echo 'Stopping daisy-grpc-web...'
          docker stop daisy-grpc-web || echo 'skipping error...'
          echo 'Running daisy-grpc-web...'
          docker run -d --rm -p ${_WEB_GRPC_PORT}:50052 \
            --network DaisyInternal \
            --name daisy-grpc-web \
            -it tiendvlp/daisy_grpc:latest GrpcServices.dll
        """
      }
    }
    stage('Launch gRPC Mobile') {
      steps {
        sh """
          echo 'Stopping daisy-grpc-mobile...'
          docker stop daisy-grpc-mobile || echo 'skipping error...'
          echo 'Running daisy-grpc-mobile...'
          docker run -d --rm -p ${_MOBILE_GRPC_PORT}:50152 \
            --network DaisyInternal \
            --name daisy-grpc-mobile \
            -it tiendvlp/daisy_grpc:latest MobileGrpcServices.dll
        """
      }
    }
    stage('Launch Web') {
      steps {
        sh """
          echo 'Stopping daisy-flutter-web...'
          docker stop daisy-flutter-web || echo 'skipping error...'
          echo 'Running daisy-flutter-web...'
          docker run -d --rm -p ${_WEB_APP_PORT}:8081 \
            --network DaisyInternal \
            --name daisy-flutter-web \
            tiendvlp/daisy_flutter_web:latest
        """
      }
    }
  }
}
