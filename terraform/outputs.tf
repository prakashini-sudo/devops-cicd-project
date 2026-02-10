output "jenkins_public_ip" {
  description = "Public IP of Jenkins EC2"
  value       = aws_instance.jenkins.public_ip
}

output "jenkins_private_ip" {
  description = "Private IP of Jenkins EC2"
  value       = aws_instance.jenkins.private_ip
}

output "k8s_master_public_ip" {
  description = "Public IP of Kubernetes Master"
  value       = aws_instance.k8s_master.public_ip
}

output "k8s_master_private_ip" {
  description = "Private IP of Kubernetes Master"
  value       = aws_instance.k8s_master.private_ip
}

output "k8s_worker_public_ip" {
  description = "Public IP of Kubernetes Worker"
  value       = aws_instance.k8s_worker.public_ip
}

output "k8s_worker_private_ip" {
  description = "Private IP of Kubernetes Worker"
  value       = aws_instance.k8s_worker.private_ip
}
