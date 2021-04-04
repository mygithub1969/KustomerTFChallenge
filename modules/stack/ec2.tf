resource "aws_instance" "webservers" {
  count = length(var.subnets_cidr)
  ami = var.webservers_ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.security_group.id]
  subnet_id = element(aws_subnet.public.*.id,count.index)
  associate_public_ip_address = true
  user_data = <<EOF
#!/bin/sh
sudo amazon-linux-extras install nginx1 -y
sudo service nginx start
EOF
}

resource "aws_security_group" "security_group" {
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



