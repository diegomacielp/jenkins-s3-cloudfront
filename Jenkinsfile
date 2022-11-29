pipeline {
    agent any
    environment {
        TERRAFORM_STATE_DIR = '/var/lib/jenkins/terraform-state'
    }
    stages {
        stage('Deploy Infra') {
            agent {
                docker {
                    image 'hashicorp/terraform:1.2.3'
                    args '-v "$TERRAFORM_STATE_DIR":/backend --entrypoint='
                }
            }
            steps {
                withAWS(credentials:'AWS_CREDENTIAL') {
                    dir(path: 'terraform/') {
                        sh 'terraform init'
                        sh 'terraform plan'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
        stage('Deploy Application') {
            agent {
                docker {
                    image 'diegomacielp/awscli:2.9.2'
                }
            }
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: "AWS_CREDENTIAL",]]) {
                    sh 'aws s3 cp index.html s3://test.tallos.com.br/"'
                }
            }
        }
    }
}
