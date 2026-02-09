pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/<your-username>/devops-cicd-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t praka555/web-app:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push praka555/web-app:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                ssh -i /var/snap/jenkins/common/.ssh/devops-key-new.pem \
                  -o StrictHostKeyChecking=no \
                  ubuntu@13.201.119.87 \
                  "kubectl apply -f /home/ubuntu/deployment.yaml &&
                   kubectl apply -f /home/ubuntu/service.yaml"
                '''
            }
        }
    }
}
