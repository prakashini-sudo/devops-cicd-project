provider "aws" {
  region = "ap-south-1"
}

# Default VPC

data "aws_vpc" "default" {
  default = true
}

# Public Subnet

resource "aws_subnet" "devops_subnet" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = "172.31.240.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops-public-subnet"
  }
}

############################
# Internet Gateway
############################
resource "aws_internet_gateway" "devops_igw" {
  vpc_id = data.aws_vpc.default.id

  tags = {
    Name = "devops-igw"
  }
}


# Route Table
resource "aws_route_table" "devops_rt" {
  vpc_id = data.aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_igw.id
  }

  tags = {
    Name = "devops-rt"
  }
}

# Route Table
resource "aws_route_table_association" "devops_rta" {
  subnet_id      = aws_subnet.devops_subnet.id
  route_table_id = aws_route_table.devops_rt.id
}

# Security Group
resource "aws_security_group" "devops_sg" {
  name   = "devops-sg-final"
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 - Jenkins
resource "aws_instance" "jenkins" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = "t3.micro"
  key_name               = "devops-key-new"
  subnet_id              = aws_subnet.devops_subnet.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "EC2-Jenkins"
  }
}

# EC2 - Kubernetes Master
resource "aws_instance" "k8s_master" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = "t3.micro"
  key_name               = "devops-key-new"
  subnet_id              = aws_subnet.devops_subnet.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "EC2-K8s-Master"
  }
}

# EC2 - Kubernetes Worker
resource "aws_instance" "k8s_worker" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = "t3.micro"
  key_name               = "devops-key-new"
  subnet_id              = aws_subnet.devops_subnet.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "EC2-K8s-Worker"
  }
}
