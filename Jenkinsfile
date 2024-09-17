pipeline {
    agent any
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
                echo "Deploying the application ${params.Version}"
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
