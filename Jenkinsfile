pipeline {
    agent any
    stages {
        state('Deploy S3') {
            agent {
                docker {
                    image 'hashicorp/terraform:1.3.5'
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
