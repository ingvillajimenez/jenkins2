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
            sh 'sonar-scanner'
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