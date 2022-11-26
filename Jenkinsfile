pipeline {
    agent any
    stages {
        stage('Deploy S3') {
            agent {
                docker {
                    image 'hashicorp/terraform:1.2.3'
                    args '--entrypoint='
                }
            }
            steps {
                dir(path: 'terraform/') {
                    sh 'terraform init'
                }
            }
        }
    }
}
