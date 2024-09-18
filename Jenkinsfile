pipeline {
    agent any
    parameters {
        choice(name: 'Version', choices: ['0.1', '0.2', '0.3'], description: 'Select Version for deployment')
        booleanParam(name: 'ExecuteBUILD', defaultValue: true, description: 'Execute build phase?')
    }

    environment {
        JOB_NAME = 'fareed-test-pipeline'
        SERVER_CREDENTIALS = credentials('fareed-gmail')
    }

    stages {
        stage("Build") {
            steps {
                echo 'Building the application'
                echo "Job name: ${JOB_NAME}"
            }
        }
        stage("Test") {
            when {
                expression {
                    return params.ExecuteBUILD
                }
            }
            steps {
                echo 'Testing the application'
            }
        }
        stage("Deploy") {
            steps {
                echo 'Deploying the application'
                echo "Deploying version: ${params.Version}"
            }
        }
    }

    post {
        always {
            echo "This will run regardless of build success or failure."
        }
        success {
            echo "The build was successful!"
        }
        failure {
            echo "The build failed."
        }
    }
}
