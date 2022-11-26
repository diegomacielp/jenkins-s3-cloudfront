pipeline {
    agent any
    stages {
        stage('Deploy S3') {
            agent {
                docker {
                    image 'hashicorp/terraform:1.3.5'
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
