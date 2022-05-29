def repo
def FUNCTION_TESTING_REPORT_FILE_NAME = 'FunctionalTestingReports'
def APPSETTINGS_FILE_PATH = '/var/jenkins_home/workspace/var-environment-all/daisy-appsettings.json'

pipeline {
    agent any
    triggers {
        // check every minutes
        pollSCM('* * * * *')
    }
    environment {
      // Replace the credentials with your webhook url, and Katalon api key
      // DISCORD_WEBHOOK = credentials('discord-fptbook-webhook')
      // DOTNET_APPSETTINGS_FILE_PATH = credentials('env/daisy-core-services');
      GIT_COMMIT_SHORT = ''
    }
    options {
      disableConcurrentBuilds() 
      // maximum 10 artifacts to be kept
      buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '10', daysToKeepStr: '', numToKeepStr: '10')
    }
    stages {
      stage ('Checking out') {
        steps {
          script {
            repo = checkout scm
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
              docker build --no-cache -f pipeline/FlutterWeb.Dockerfile -t tiendvlp/daisy_flutter_web:${GIT_COMMIT_SHORT} .
              docker build --no-cache -f pipeline/FlutterWeb.Dockerfile -t tiendvlp/daisy_flutter_web:latest .
              """
            }
          }
        }
      }
      stage ('Setting up network') {
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
              dotnet ef database update --startup-project DataAccess
            """
           }
        }
      }
      stage('Launch Api') {
        steps {
          sh """
              echo 'Stopping daisy-api...'
              docker stop daisy-api || echo 'skipping error...'
              echo 'Running daisy-api...'
              docker run -d -p 2433:2433 --rm --network DaisyInternal --name daisy-api tiendvlp/daisy_api:latest
          """
        }
      }
      stage('Launch gRPC') {
        steps {
          sh """
              echo 'Stopping daisy-grpc...'
              docker stop daisy-grpc || echo 'skipping error...'
              echo 'Running daisy-grpc...'
              docker run -d -p 50052:50052 --rm --network DaisyInternal --name daisy-grpc tiendvlp/daisy_grpc:latest
          """
        }
      }
      stage('Launch Web') {
        steps {
          sh """
              echo 'Stopping daisy-flutter-web...'
              docker stop daisy-flutter-web || echo 'skipping error...'
              echo 'Running daisy-flutter-web...'
              docker run -p 8081:8081 -d --rm --network DaisyInternal --name daisy-flutter-web tiendvlp/daisy_flutter_web:latest
          """
        }
      }
    }
}
