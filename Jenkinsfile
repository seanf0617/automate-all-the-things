pipeline {
    environment {
        imageName = "chrisgallivan/automate-all-the-things-docker"
        registryCredential = 'docker_hub'
        dockerImage = ''
        AWS_CREDENTIALS_USR = ''
        AWS_CREDENTIALS_PSW = ''
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
				        usernameVariable: '$AWS_CREDENTIALS_USR', passwordVariable: '$AWS_CREDENTIALS_PSW']
		            ]) {
                    
		    echo $AWS_CREDENTIALS_USR
                    sh 'terraform init -backend-config="' + '"$BACKEND_FILE"' +  '" backend-config=' + '"subpath=$BACKEND_PATH"'
                    sh 'terraform plan -out=plan.tfplan ' + ' -var deployment_username=' + $AWS_CREDENTIALS_USR + ' -var deployment_password=' + $AWS_CREDENTIALS_PSW
                    
                    }
                }
            }
        }
        
    }
        
}
