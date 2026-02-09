pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/<your-username>/<your-repo>.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t <dockerhub-username>/java-app:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push <dockerhub-username>/java-app:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                kubectl apply -f k8s/
                kubectl rollout status deployment/java-app
                '''
            }
        }
    }
}

