pipeline {
    agent any

    environment {
        IMAGE_NAME = "nginx-devops"
        DOCKERHUB_USERNAME = "praka555"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git 'YOUR_GITHUB_REPO_LINK'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKERHUB_USERNAME/$IMAGE_NAME .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'docker-pass', variable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                    sh 'docker push $DOCKERHUB_USERNAME/$IMAGE_NAME'
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
