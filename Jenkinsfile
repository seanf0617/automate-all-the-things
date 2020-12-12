pipeline {
    environment {
        imagename = "chrisgallivan/automate-all-the-things"
    }
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'npm install-test'
                  }
        }
        stage('Build Docker Image') {
            steps {
                script{
                 docker.build imagename
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
