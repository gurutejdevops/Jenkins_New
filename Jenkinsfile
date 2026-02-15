pipeline {
    agent any

    environment {
        ENV_URL = "pipeline.google.com" //pipeline: All the stages of the pipeline can use it.
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
            environment {
                BATCH = "b55"
            }
            steps {
                sh "echo stage two "
                sh "echo ${BATCH}"
            }
        }
        stage('stage three') {
            steps {
                sh "echo stage three "
            }
        }
    }
}
