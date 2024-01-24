pipeline {
    agent any
    parameters{
        // string(name: 'Version', defaultValue: '', description: 'FOR QA ENV')
        choice(name: 'Version', choices: ['0.1','0.2','0.3'], description: '')
        booleanParam(name: 'ExecuteBUILD', defaultValue: true, description: '')
    }
    tools {                               //THESE ARE ADDED FOR BUILD TOOLS, Only 3 available MAVEN,GRADLE, JDK 
        
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
            when {
                exec.ExecuteBUILD
            }
            steps {
                echo 'Testing the application'
            }
        }
        stage("Deploy") {
            steps {
                echo 'Deploying the application'
                //withCredentials([
                  //  usernamePassword(credentials: 'fareed-gmail', userVariable: USER , passVariable: PWD)
                //]) {
                  //  sh "some scripts ${USER} ${PWD}"
                //}
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
