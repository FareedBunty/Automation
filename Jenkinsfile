pipeline {
    agent any
    environment{
        JOB_NAME
    }
    stages {
        stage("Build") {
            steps {
                echo 'Building the application'
                echo $JOB_NAME
            }
        }
        stage("Test") {
            steps {
                echo 'Testing the application'
            }
        }
        stage("Deploy") {
            steps {
                echo 'Deploying the application'
            }
        }
    }
}
