pipeline {
    environment {
        imageName = "chrisgallivan/automate-all-the-things-docker"
        registryCredential = 'docker_hub'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building Node app...'
                sh 'npm install-test'
                  }
        }
        stage('Build Docker Image') {
             steps {
                echo 'Building Docker image...'
                script{
                    dockerImage = docker.build imageName
                }
            }
        }
        stage('Deploy to Docker Hub') {
            steps {
                echo 'Publishing Image to Docker Hub...'
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
        
}
