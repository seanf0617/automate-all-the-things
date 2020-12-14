pipeline {
    environment {
        imageName = "chrisgallivan/automate-all-the-things-docker"
        registryCredential = 'docker_hub'
        dockerImage = ''
        BACKEND_FILE = "terraformConfig.tf"
        BACKEND_PATH = "global/s3/terraform.tfstate"
	
        
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
                    //AWS_CREDENTIALS = credentials('AWS_ACCESS_KEY')
                    withCredentials([
			           [$class: 'UsernamePasswordMultiBinding', credentialsId: 'AWS_ACCESS_KEY',
				        usernameVariable: 'DEPLOYMENT_USERNAME', passwordVariable: 'DEPLOYMENT_PASSWORD']
		            ]) {
                    //withCredentials([usernamePassword(credentialsId: 'AWS_ACCESS_KEY', passwordVariable: 'DEPLOYMENT_PASSWORD', usernameVariable: 'DEPLOYMENT_USERNAME')]) {
		    //sh 'export AWS_ACCESS_KEY_ID=$DEPLOYMENT_USERNAME'
	            //sh 'export AWS_SECRET_KEY_ID=$DEPLOYMENT_PASSWORD' 
	            sh 'cd /var/jenkins_home/workspace/automate-all-the-things'
                    //sh 'terraform init -backend-config="' + '"$BACKEND_FILE"' +  '" backend-config=' + '"subpath=$BACKEND_PATH"'
	            sh 'terraform init -backend-config="' + '"$BACKEND_FILE"'
                    sh 'terraform plan -out=plan.tfplan -var deployment_username=$DEPLOYMENT_USERNAME -var deployment_password=$DEPLOYMENT_PASSWORD'
		    sh 'terraform apply -auto-approve plan.tfplan'
                    
                    }
                }
            }
        }
        
    }
        
}
