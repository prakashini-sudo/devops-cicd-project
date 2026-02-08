pipeline {
    agent any

    environment {
        IMAGE_NAME = "nginx-devops"
        DOCKERHUB_USERNAME = "Praka555"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git 'https://github.com/prakashini-sudo/devops-cicd-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $Praka555/$Praka555/ngnix-devops'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'docker-pass', variable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                    sh 'docker push $Praka555/$ngnix-devops'
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
