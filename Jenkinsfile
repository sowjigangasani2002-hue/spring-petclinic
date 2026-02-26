pipeline {
    agent {label "java"}
    stages {
        stage('git checkout') {
            steps {
                 git url: 'https://github.com/spring-projects/spring-petclinic.git',
                branch: 'main'
            }
        }

        stage('build and scan') {
            steps {
                sh 'mvn package sonar:sonar'
            }
        }
    }
}