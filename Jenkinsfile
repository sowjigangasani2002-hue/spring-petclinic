/*
pipeline {
    agent {label "java"}
    triggers {
        pollSCM('* * * * *')
    
    }
    stages {
        stage('git checkout') {
            steps {
                 git url: 'https://github.com/sowjigangasani2002-hue/spring-petclinic.git',
                branch: 'main'
            }
        }

        stage('build and scan') {
            steps {
              withCredentials([string(credentialsId: 'sonar_id', variable: 'SONAR_TOKEN')])  {
              withSonarQubeEnv('sonar')  {
                sh """mvn clean package sonar:sonar \
                      -Dsonar.projetKey=sowjigangasani2002-hue_spring-petclinic \
                      -Dsonar.organization= sowjigangasani2002-hue \
                      -Dsonar.host.url=https"//https://sonarcloud.io \
                      -Dsonar.login=$SONAR_TOKEN"""

              }
                
            }
        }
        
      }
    }
}

*/

pipeline {
    agent { label "java" }

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

       /* stage('Build') {
            steps {
                sh '''
                    mvn clean package
                '''
            }
        }
        */

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
}
}