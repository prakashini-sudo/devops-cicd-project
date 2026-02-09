pipeline {
  agent any

  environment {
    KUBECONFIG = "/var/snap/jenkins/common/.kube/config"
    NO_PROXY   = "localhost,127.0.0.1,172.31.240.147"
    no_proxy   = "localhost,127.0.0.1,172.31.240.147"
  }

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
          # HARD RESET ALL PROXY VARIABLES
          unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY

          echo "Using kubeconfig: $KUBECONFIG"
          kubectl version --client
          kubectl get nodes
          kubectl apply -f deployment.yaml
          kubectl apply -f service.yaml
        '''
      }
    }
  }
}
