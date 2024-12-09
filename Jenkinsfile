pipeline {
  // agent { label 'ubuntu' }
  agent any

  stages {
    stage('Verificar docker') {
      steps {
        sh 'docker info'
      }
    }


    stage('Sonarqube') {
      steps {
        script {
          docker.image('sonarsource/sonar-scanner-cli:5.0.1').inside('--network ci-network') {
            sh '''
              sonar-scanner \
                -Dsonar.host.url=http://sonarqube:9000 \
                -Dsonar.projectKey=my-php-app \
                -Dsonar.sources=src \
                -Dsonar.token=squ_9d526fbcf214a87c6105f3279b9750be8bce6d45
            '''
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