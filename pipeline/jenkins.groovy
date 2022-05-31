/* groovylint-disable CompileStatic, DuplicateStringLiteral, NestedBlockDepth, NoDef, VariableTypeRequired */
/* groovylint-disable-next-line NoDef, VariableName, VariableTypeRequired */
final APPSETTINGS_FILE_PATH = '/var/jenkins_home/workspace/var-environment-all/daisy-appsettings.json'

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
      artifactNumToKeepStr: '10',
      daysToKeepStr: '',
      numToKeepStr: '10'
    )
  }
  stages {
    stage('Parameterize') {
      steps {
        script {
          properties([parameters([
            string(description: 'The branch of URL that you want to deploy', name: 'TARGET_BRANCH', trim: true),
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
          def repo = checkout([$class: 'GitSCM', branches: [[name: TARGET_BRANCH]],
            userRemoteConfigs: [[url: 'https://github.com/sode-co/daisy-application']]])
          dir('daisy-application') {
            GIT_COMMIT_SHORT = sh(
              script: "printf \$(git rev-parse --short ${repo.GIT_COMMIT})",
              returnStdout: true)
          }

          echo "Git commit short hash: ${GIT_COMMIT_SHORT}"
        }
      }
    }
    stage('Setup environment') {
      steps {
        script {
          dir('./') {
            sh """
              mkdir -p pipeline/env
              mkdir -p daisy-core-services/Shared
              cp ${APPSETTINGS_FILE_PATH} pipeline/env/appsettings.json
              cp ${APPSETTINGS_FILE_PATH} daisy-core-services/Shared/appsettings.json
            """
          }
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
      when {
        expression {
          return TARGET_BRANCH == 'main'
        }
      }
      steps {
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
    stage('Launch Api') {
      steps {
        sh """
          echo 'Stopping daisy-api...'
          docker stop daisy-api || echo 'skipping error...'
          echo 'Running daisy-api...'
          docker run -d -p \
            ${API_PORT}:2433 \
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
          docker run -d --rm -p ${WEB_GRPC_PORT}:50052 \
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
          docker run -d --rm -p ${MOBILE_GRPC_PORT}:50152 \
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
          docker run -d --rm -p ${WEB_APP_PORT}:8081 \
            --network DaisyInternal \
            --name daisy-flutter-web \
            tiendvlp/daisy_flutter_web:latest
        """
      }
    }
  }
}
