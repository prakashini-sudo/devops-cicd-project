pipeline {
    agent any

    environment {
        IMAGE_NAME = "nginx-devops"
        DOCKERHUB_USERNAME = "praka555"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKERHUB_USERNAME/$IMAGE_NAME .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'docker-pass', variable: 'DOCKER_PASS')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u  praka555 --password-stdin'
                    sh 'docker push  praka555/nginx-devops'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}

