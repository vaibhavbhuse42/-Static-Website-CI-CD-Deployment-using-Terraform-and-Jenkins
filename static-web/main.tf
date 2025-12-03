provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "terraform" {
  key_name   = "terraform_final"
  public_key = file("C:/Users/vaibh/Downloads/terraform_final_openssh.pub")
}

resource "aws_security_group" "blog-web" {
  name = "blog-web"

 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "bolg-web" {
  ami                    = "ami-02d26659fd82cf299"  
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.blog-web.id]
 key_name               = aws_key_pair.terraform.key_name
  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "blog-web"
  }
  
  
}
