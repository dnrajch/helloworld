pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_IMAGE = "first-app"  
        REPO_URL = "git@github.com:dnrajch/helloworld.git"
        BRANCH_NAME = "main"
        AWS_REGION = "ap-south-1"
        ECR_REGISTRY = "443370700928.dkr.ecr.ap-south-1.amazonaws.com"
        ECR_REPOSITORY = "myapps"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout Code') {
            steps {
               
                // Checkout the code from your repository
                git(
                        url: "${REPO_URL}",
                        branch: "${BRANCH_NAME}"
                    )
            
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: '6e0e2039-7f20-409b-af2f-f3a5c43df75d', passwordVariable: 'aws-secret-access-key', usernameVariable: 'aws-access-key-id')]) {
    // some block

                    // Build the Docker image using the Dockerfile in the repository
                        docker.build("${DOCKER_IMAGE}:${IMAGE_TAG}")
                        sh """
                            export AWS_ACCESS_KEY_ID=${aws-access-key-id}
                            export AWS_SECRET_ACCESS_KEY=${aws-secret-access-key}
                            export AWS_DEFAULT_REGION=${AWS_REGION}
                            aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY}
                            docker tag ${DOCKER_IMAGE}:${IMAGE_TAG} ${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG}
                            docker push ${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG}
                        """
                    }
                }

            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                        sh """
                            
                            docker stop myapp-container || true  # Stop running container (if any)
                            docker rm myapp-container || true  # Remove old container (if any)
                            docker run -d --name myapp-container -p 5000:5000 first-app  # Run new container
                            
                        """
                    }
                }
            }
        }
    

    post {
        always {
            // Clean up any temporary files or actions
            cleanWs()
        }
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
