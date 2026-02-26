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
              withCredentials([string(withCredentialsId: 'sonar_id', variable: 'SONAR_TOKEN')])  {
              withSonarQubeEnv('sonar')  {
                sh """mvn package sonar:sonar \
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

