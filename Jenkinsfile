pipeline {
    environment {
        imageName = "chrisgallivan/automate-all-the-things-docker"
        registryCredential = 'docker_hub'
        dockerImage = ''
        AWS_CREDENTIALS = ''
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
                script{
                    echo 'Building Docker image...'
                    dockerImage = docker.build imageName
                }
             }
        }
        stage('Deploy to Docker Hub') {
            steps {
               script {
                    echo 'Publishing Image to Docker Hub...'
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
                    }
                }
             }
        }
        stage('Remove Local Image') {
            steps {
               script {
                    sh "docker rmi $imageName:$BUILD_NUMBER"
                    sh "docker rmi $imageName:latest"
                    }
                }
        }
        stage('Provision Cluster') {
            steps {
                script {
                    echo 'Provisioning Kubernetes Cluster...'
                    AWS_CREDENTIALS = credentials('AWS_ACCESS_KEY')
                }
            }
        }
        
    }
        
}
