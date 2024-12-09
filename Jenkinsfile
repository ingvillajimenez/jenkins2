pipeline {
  // agent { label 'ubuntu' }
  agent any

  environment {
    SONAR_TOKEN = credentials('sonar')
  }

  stages {
    stage('Verificar docker') {
      steps {
        sh 'docker info'
      }
    }


    stage('sonarqube-server') {
      steps {
        withSonarQubeEnv('sonarqube-server') {
          script {
            docker.image('sonarsource/sonar-scanner-cli:5.0.1').inside('--network ci-network') {
              sh '''
                sonar-scanner \
                  -Dsonar.host.url=http://sonarqube:9000 \
                  -Dsonar.projectKey=my-php-app \
                  -Dsonar.sources=src \
                  -Dsonar.token=$SONAR_TOKEN \
                  -Dsonar.branch.name=${BRANCH_NAME}
              '''
            }
          }
        }
      }
    }


    // stage('Docker build') {
    //   steps {
    //     sh 'docker build -t php-app .'
    //   }
    // }

    // stage('Run tests') {
    //   steps {
    //     sh 'docker run --rm php-app ./vendor/bin/phpunit tests'
    //   }
    // }

    // stage('Deploy') {
    //   steps {
    //     sshagent (credentials: ['server-deploy']) {
    //       sh './deploy.sh'
    //     }
    //   }
    // }
  }

  // post {
  //   success {
  //     slackSend (color: '#00FF00', channel: '#tutorial', message: "Todo bien")
  //   }

  //   failure {
  //     slackSend (color: '#FF0000', channel: '#tutorial', message: "Algo salió mal")
  //   }
  // }

}