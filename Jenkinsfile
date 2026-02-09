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
                sudo -u ubuntu \
                  KUBECONFIG=/var/snap/jenkins/common/.kube/config \
                  /snap/bin/kubectl apply --validate=false -f deployment.yaml

                sudo -u ubuntu \
                  KUBECONFIG=/var/snap/jenkins/common/.kube/config \
                  /snap/bin/kubectl apply --validate=false -f service.yaml
                '''
            }
        }
    }
}
