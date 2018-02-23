provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
  region     = "${var.AWS_REGION}"
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_all"
  }
}


resource "aws_instance" "api-0" {
  ami           = "${var.AWS_AMI}"
  instance_type = "t2.micro"
  key_name = "${var.AWS_INSTANCE_KEY_NAME}"  
  security_groups = [
    "${aws_security_group.allow_all.name}"
  ]
  tags {
    Name = "API-0"
    Owner = "dgomez"
  }
}


resource "aws_instance" "api-1" {
  ami           = "${var.AWS_AMI}"
  instance_type = "t2.micro"
  key_name = "${var.AWS_INSTANCE_KEY_NAME}"
  security_groups = [
    "${aws_security_group.allow_all.name}"
  ]
  tags {
    Name = "API-1"
    Owner = "dgomez"
  }  
}


resource "aws_instance" "load-balancer-0" {
  ami           = "${var.AWS_AMI}"
  instance_type = "t2.micro"
  key_name = "${var.AWS_INSTANCE_KEY_NAME}"
  security_groups = [
    "${aws_security_group.allow_all.name}"
  ]
  user_data = "${file("balancer.sh")}"
  tags {
    Name = "LB-0"
    Owner = "dgomez"
  }
}
