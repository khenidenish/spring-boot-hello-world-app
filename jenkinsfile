pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
         stage('Clone repository') { 
            steps { 
                script{
                checkout scm
                }
            }
        }

        stage('Build') { 
            steps { 
                script{
                 app = docker.build("underwater")
                }
            }
        }
        stage('Test'){
            steps {
                 echo 'Empty'
            }
        }
        stage('Deploy') {
            steps {
                script{
                        docker.withRegistry('https://549942532493.dkr.ecr.ap-southeast-1.amazonaws.com', 'ecr:ap-southeast-1:d9445466-5fe6-42df-8c50-ab29571a879d') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                    }
                }
            }
        }
    }
}
