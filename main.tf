resource "aws_instance" "ecc" {
  ami           = "ami-06e46074ae430fba6"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.tf_sg.name ]
  tags = {
    Name = "practice"
  }
}

resource "aws_security_group" "tf_sg" {
  name        = "tf_sg"
  description = "Allow SSH/HTTP inbound traffic"
  vpc_id      = "vpc-053c6581935b2526c"

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  tags= {
    Name = "SG with TF"
  }
}