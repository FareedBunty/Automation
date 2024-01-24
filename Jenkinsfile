pipeline {
    agent any
    environment{
        JOB_NAME = 'Fareed-test'
        SERVER_CREDENTIALS = credentials('fareed-gmail')
    }
    stages {
        stage("Build") {
            steps {
                echo 'Building the application'
                echo JOB_NAME
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
                withCredentials([
                    usernamePassword(credentials: 'fareed-gmail', userVariable: USER , passVariable: PWD)
                ]) {
                    sh "some scripts ${USER} ${PWD}"
                }
            }
        }
    }
    post{
        always{
            echo "This will run everytime whether the build is success or failed"
        }
        success{
            echo "This portion will run only if build will be successfully build"
        }
        failure{
            echo "This portion will run only if build is failure" 
        }
    }
}
