pipeline {
    agent any

    stages {

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
                export KUBECONFIG=/var/snap/jenkins/common/.kube/config
                kubectl apply -f deployment.yaml
                kubectl apply -f service.yaml
                '''
            }
        }
    }
}
