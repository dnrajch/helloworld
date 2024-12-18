pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_IMAGE = "first-app"  // Name of your Docker image
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from your repository
                git 'git@github.com:dnrajch/helloworld.git'  // Replace with your repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the repository
                    docker.build(DOCKER_IMAGE)
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
