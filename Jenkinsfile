pipeline {
  agent { label 'ubuntu' }

  stages {
    stage('Verificar Docker') {
      steps {
        sh 'docker info'
      }
    }

    // stage('Build Docker Image') {
    //   steps {
    //     sh 'docker build -t php-app .'
    //   }
    // }

    stage('Run Docker Container') {
      steps {
        sh 'docker run -dit --name php-app php-app'
      }
    }

    stage('Run Test') {
      steps {
        sh 'docker exec php-app ./vendor/bin/phpunit tests'
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