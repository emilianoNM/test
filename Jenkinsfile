pipeline {
  environment {
                     HOME = "."
            }
    stages {
        stage('Build') {
             
            steps {
                sh 'ls'
                sh 'docker-compose build'
            }
        }
        stage('Test') {
            environment {
                     HOME = "."
            }
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') {
            environment {
                     HOME = "."
            }
            steps {
               sh 'docker-compose up'
            }
        }
    }
}
