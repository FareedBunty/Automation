def gv
pipeline {
    agent any
    parameters {
        choice(name: 'Version', choices: ['0.1', '0.2', '0.3'], description: 'Select Version for deployment')
        booleanParam(name: 'ExecuteBUILD', defaultValue: true, description: 'Execute build phase?')
    }

    environment {
        JOB_NAME = 'fareed-test-pipeline'
        SERVER_CREDENTIALS = credentials('server-creds')
    }

    stages {
        stage("Build") {
            steps {
                script{
                    gv.buildAPP()
                }
            }
        }
        stage("Test") {
            when {
                expression {
                    return params.ExecuteBUILD
                }
            }
            steps {
                script{
                    gv.testAPP()
                }
            }
        }
        stage("Deploy") {
            steps {
                script{
                    gv.deployAPP()
                }
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
