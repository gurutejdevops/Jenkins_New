pipeline {
    agent any

    environment {
        ENV_URL = "pipeline.google.com" //pipeline: All the stages of the pipeline can use it.
        SSH_CRED = credentials('aws-user')
    }

    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')
        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value2')
        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a passworddd')
    }

    // triggers {
    //     pollSCM('*/2 * * * *')
    // }

    tools {
        maven 'maven-3.9.0'
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
                sh "mvn --version"
            }
        }
        stage('stage three') {
            steps {
                sh '''
                echo stage three
                env
                '''
            }
        }
    }
}
