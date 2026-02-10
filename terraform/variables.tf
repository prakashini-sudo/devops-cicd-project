variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu 22.04"
  default     = "ami-0f5ee92e2d63afc18"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  default     = "devops-key-new"
}

variable "availability_zone" {
  description = "Availability Zone"
  default     = "ap-south-1a"
}

variable "subnet_cidr" {
  description = "CIDR block for public subnet"
  default     = "172.31.240.0/24"
}
