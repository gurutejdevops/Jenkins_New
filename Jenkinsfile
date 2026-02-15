pipeline {
    agent any

    environment {
        ENV_URL = "pipeline.google.com"
    }

    stages {
        stage('stage one') {
            steps {
                sh '''
                echo stage one 
                echo welcome to Jenkins
                echo ${ENV_URL}
                '''
            }
        }
        stage('stage two') {
            steps {
                sh "echo stage two "
            }
        }
        stage('stage three') {
            steps {
                sh "echo stage three "
            }
        }
    }
}
