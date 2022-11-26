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
                withAWS(credentials:'AWS_CREDENTIAL') {
                    dir(path: 'terraform/') {
                        sh 'terraform init'
                        sh 'terraform plan'
                    }
                }
            }
        }
    }
}
