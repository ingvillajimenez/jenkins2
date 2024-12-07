pipeline {
  // agent { label 'ubuntu' }
  agent any

  stages {
    stage('Verificar Docker') {
      steps {
        sh 'docker info'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t php-app .'
      }
    }

    stage('Run Docker Container') {
      steps {
        sh 'docker run -dit --name php-app php-app'
      }
    }

    stage('Run Tests') {
      steps {
        sh 'docker exec php-app ./vendor/bin/phpunit tests'
      }
    }

    stage('Deploy') {
      steps {
        sshagent (credentials: ['server-deploy']) {
          sh './deploy.sh'
      }
    }
  }

  post {
    always {
      sh 'docker stop php-app'
      sh 'docker rm php-app'
    }

    success {
      slackSend (color: '#00FF00', channel: '#tutorial', message: "Todo bien")
    }

    failure {
      slackSend (color: '#FF0000', channel: '#tutorial', message: "Algo salió mal")
    }
  }

}