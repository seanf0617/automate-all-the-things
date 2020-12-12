pipeline {
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
                 docker.build("chrisgallivan/automate-all-the-things-docker", "--no-cache -f dockerfile .")
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
