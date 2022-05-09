terraform {
  cloud {
    organization = "portfolio-1"
    workspaces {
      name = "terraform-aws-portfolio-1"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  # profile = "default" //for local to tf cloud, wont work with gh to tf cloud workflow
  region = "us-west-1"

}


resource "aws_instance" "portfolio-1" {
  ami           = "ami-01f87c43e618bf8f0"
  instance_type = "t2.micro"

# to install code pipeline in the ec2
  user_data = <<-EOF
              #!/bin/bash
              sudo apt -y update
              sudo apt -y install ruby
              sudo apt -y install wget
              cd /home/ubuntu
              wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
              sudo chmod +x ./install
              sudo ./install auto
              curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
              . ~/.nvm/nvm.sh
              nvm install node
              EOF

  tags = {
    Name = "portfolio-1b"
  }
}