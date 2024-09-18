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
        stage("Load Script") {
            steps {
                script {
                    // Load the external Groovy script into 'gv'
                    gv = load 'script.groovy'
                }
            }
        }
        stage("Build") {
            steps {
                script {
                    gv.buildAPP() // Call method from the loaded script
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
                script {
                    gv.testAPP() // Call method from the loaded script
                }
            }
        }
        stage("Deploy") {
            input{
                message "Please Select the Environment where you want to deploy the application"
                ok "DONE"
                parameters{
                    choice(name: 'ENV', choices: ['DEV', 'STAGING', 'PRODUCTION'], description: 'Select Version for deployment')
                }
            }
            steps {
                script {
                    gv.deployAPP(params.Version) // Pass the 'Version' parameter correctly
                    echo "Deploying the ${ENV}"
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
