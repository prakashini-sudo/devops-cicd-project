pipeline {
    agent any

    environment {
        K8S_HOST = "13.201.119.87"
        SSH_KEY  = "/home/ubuntu/.ssh/devops-key-new.pem"
        IMAGE    = "praka555/web-app:latest"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh """
                ssh -i $SSH_KEY -o StrictHostKeyChecking=no ubuntu@$K8S_HOST << EOF
                  kubectl apply -f /home/ubuntu/deployment.yaml
                  kubectl apply -f /home/ubuntu/service.yaml
                EOF
                """
            }
        }
    }
}

