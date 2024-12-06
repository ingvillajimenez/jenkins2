pipeline {
  agent { label 'ubuntu' }

  stages {
    stage('Verificar Docker') {
      steps {
        sh 'docker info'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t php-app .'
      }
    }

    stage('Run Test') {
      steps {
        sh 'docker run --rm php-app ./vendor/bin/phpunit ./tests'
      }
    }
  }

  post {
    success {
      slackSend (color: '#00FF00', channel: '#tutorial', message: "Todo bien")
    }

    failure {
      slackSend (color: '#FF0000', channel: '#tutorial', message: "Algo salió mal")
    }
  }

}