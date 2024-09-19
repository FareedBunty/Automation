pipeline {
    agent any
      stages {
        stage("Test") {
           steps {
                script{
                    echo 'Testing the application'
                    echo "Executing pipeline for multip branch $BRANCH_NAME"
                }
                
            }
        }
          
        stage("Build") {
            when {
                expression{
                    BRANCH_NAME == 'main'
                }
            }
            steps {
                echo 'Building the application'
                echo JOB_NAME
            }
        }
        stage("Deploy") {
             when {
                expression{
                    BRANCH_NAME == 'master'
                }
            }
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
