pipeline {
    agent { label "spc" }

    // triggers {
    //     pollSCM('* * * * *')
    parameters {
        choice(name: 'goals', choices: ['package', 'clean install', 'verify'], description)
    }
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

        /*
        stage('Sonar Scan and Build') {
            steps {
                withCredentials([string(credentialsId: 'sonar_id', variable: 'SONAR_TOKEN')])  {
                    withSonarQubeEnv('sonar') {
                        sh '''
                            mvn clean package sonar:sonar \
                            -Dsonar.projectKey=sowjigangasani2002-hue_spring-petclinic \
                            -Dsonar.organization=sowjigangasani2002-hue \
                            -Dsonar.host.url=https://sonarcloud.io \
                            -Dsonar.login=$SONAR_TOKEN
                        '''
                    }
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        */

        stage('Spc java docker image build') {
            steps {
                sh "docker image build -t ${image_name}:${tag_name} ."
                    
            }
        }
        stage('trivy scan for image') {
            steps {
            sh "trivy image ${image_name}:${tag_name}"
        }
     }
     stage('Image push to the ECR') {
        steps {
            sh """aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 976565589539.dkr.ecr.ap-south-1.amazonaws.com && \
                  docker tag ${image_name}:${tag_name} 976565589539.dkr.ecr.ap-south-1.amazonaws.com/ecr:latest && \
                  docker image ls && \
                  docker push 976565589539.dkr.ecr.ap-south-1.amazonaws.com/ecr:latest """
        }
     }
     stage('deploy to k8s for dev') {
        steps {
            sh 'kubectl apply -f .deploy-k8s/.'
        }
     }
      

    } // <-- closes stages

} // <-- closes pipeline