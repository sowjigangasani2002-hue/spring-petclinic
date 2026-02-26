pipeline {
    agent {label "java"}
    triggers {
        pollSCM('* * * * *')
    
    }
    stages {
        stage('git checkout') {
            steps {
                 git url: 'https://github.com/spring-projects/spring-petclinic.git',
                branch: 'main'
            }
        }

        stage('build and scan') {
            steps {
              withCredentials([string(withCredentials: 'my_d', variable: 'SONAR_TOKEN')])  {
              withSonarQubeEnv('sonar')  {
                sh """mvn package sonar:sonar \
                -Dsonar.projetkey=sowjigangasani2002-hue_spring-petclinic \
                -Dsonar.organization= sowjigangasani2002-hue \
                -Dsonar.host.url=https"//https://sonarcloud.io/ \
                -Dsonar.login=$SONAR_TOKEN"""

              }
                
            }
        }
        
      }
    }
}