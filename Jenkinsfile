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
                 docker.build(dockbuild, "--no-cache -f dockerfile .")
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
