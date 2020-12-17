  
def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]

def getBuildUser() {
    return currentBuild.rawBuild.getCause(Cause.UserIdCause).getUserId()
}

pipeline {
    environment {
        imageName = "chrisgallivan/automate-all-the-things-docker"
        registryCredential = 'docker_hub'
        dockerImage = ''
        BACKEND_FILE = "terraformConfig.tf"
        BACKEND_PATH = "global/s3/terraform.tfstate"
	BUILD_USER = ''    
    }
    agent any
    stages {
        stage('Build Node App') {
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
        stage('Cleanup Local Image') {
            steps {
               script {
                    sh "docker rmi $imageName:$BUILD_NUMBER"
                    sh "docker rmi $imageName:latest"
                    }
                }
        }
        stage('Provision Cluster & Deploy Image') {
            steps {
                script {
                    echo 'Provisioning Kubernetes Cluster...'
                    withCredentials([
			           [$class: 'UsernamePasswordMultiBinding', credentialsId: 'AWS_ACCESS_KEY',
				        usernameVariable: 'DEPLOYMENT_USERNAME', passwordVariable: 'DEPLOYMENT_PASSWORD']
		     ]) {
                    
	            sh 'cd /var/jenkins_home/workspace/automate-all-the-things'
                    sh 'terraform init -backend-config=\"access_key=$DEPLOYMENT_USERNAME\"  -backend-config=\"secret_key=$DEPLOYMENT_PASSWORD\"'
                    sh 'terraform plan -out=plan.tfplan -var deployment_username=$DEPLOYMENT_USERNAME -var deployment_password=$DEPLOYMENT_PASSWORD'
		    sh 'terraform apply -auto-approve plan.tfplan'
                    }
                }
            }
        }
        stage('Slack Notification'){
            steps {
		    script {
		    	BUILD_USER = getBuildUser()
		    }
                slackSend channel: '#general-old',
                color: COLOR_MAP[currentBuild.currentResult],
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} by ${BUILD_USER}\n More info at: ${env.BUILD_URL}\n APP_URL: http://a0a87a88d82c2429ca00693710427340-1289019772.us-east-2.elb.amazonaws.com/url"
            }
        }    
    }
    
}
