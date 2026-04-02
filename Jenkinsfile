pipeline {
    agent { label "spc" }

    parameters {
        choice(
            name: 'goals',
            choices: ['package', 'clean install', 'verify'],
            description: 'Select Maven goal'
        )
    }

    environment {
        image_name = 'spc'
        tag_name = '1.0'
    }
    

    stages {

        stage('Git Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sowjigangasani2002-hue/spring-petclinic.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${image_name}:${tag_name} ."
            }
        }

        stage('Trivy Scan') {
            steps {
                sh "trivy image ${image_name}:${tag_name}"
            }
        }

        stage('Push to ECR') {
            steps {
                sh """
                aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 976565589539.dkr.ecr.ap-south-1.amazonaws.com
                docker tag ${image_name}:${tag_name} 976565589539.dkr.ecr.ap-south-1.amazonaws.com/ecr:latest
                docker push 976565589539.dkr.ecr.ap-south-1.amazonaws.com/ecr:latest
                """
            }
        }


        stage('Deploy to K8s') {
            steps {
                sh 'kubectl apply -f .deploy-k8s/'
            }
        }
    }
}