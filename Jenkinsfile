pipeline {
    agent { label "spc" }

    triggers {
        pollSCM('* * * * *')
    }

    stages {

        stage('Git Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sowjigangasani2002-hue/spring-petclinic.git'
            }
        }

    //     stage('Sonar Scan and Build') {
    //         steps {
    //             withCredentials([string(credentialsId: 'sonar_id', variable: 'SONAR_TOKEN')])  {
    //             withSonarQubeEnv('sonar') {
    //                 sh '''
    //                     mvn clean package sonar:sonar \
    //                     -Dsonar.projectKey=sowjigangasani2002-hue_spring-petclinic \
    //                     -Dsonar.organization=sowjigangasani2002-hue \
    //                     -Dsonar.host.url=https://sonarcloud.io \
    //                      -Dsonar.login=$SONAR_TOKEN
    //                 '''
    //             }
    //         }
    //     }

    // }
    // stage('Quality Gate') {
    //         steps {
    //             timeout(time:5, unit:'MINUTES') {
    //             waitForQualityGate abortPipeline: true
    //             }
    //         }
    //     }
        stage('docker image push to ecr and pulling from dockerhub ') {
            steps {
                sh """docker image pull nginx:1.29,
                aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 976565589539.dkr.ecr.ap-south-1.amazonaws.com,
                docker tag nginx:1.29 976565589539.dkr.ecr.ap-south-1.amazonaws.com/dev/spcimage:latest,
                docker push 976565589539.dkr.ecr.ap-south-1.amazonaws.com/dev/spcimage:latest"""
            }
    
}
}