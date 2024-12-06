pipeline {
  agent any

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

}