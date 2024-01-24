pipeline {
    agent any
    parameters{
        // string(name: 'Version', defaultValue: '', description: 'FOR QA ENV')
        choice(name: 'Version', choices: ['0.1','0.2','0.3'], description: '')
        booleanParam(name: 'ExecuteBUILD', defaultValue: true, description: '')
    }

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
                    when {
                params.ExecuteBUILD
                  }
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
