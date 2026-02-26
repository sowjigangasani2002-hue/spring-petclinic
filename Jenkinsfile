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
              withSonarQubeEnv('sonar')  {
                sh 'mvn package sonar:sonar'

              }
                
            }
        }
    }
}