data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.pub_sbn_a.id
  vpc_security_group_ids = [aws_security_group.web.id]
  associate_public_ip_address = true
  key_name      = var.ec2_key
  tags = {
    Name = "${var.prefix}-web1"
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<html><body><p>Index Html Page</p><img src="https://raw.githubusercontent.com/euimokna/img/main/test4.jpg"></body></html>" > /var/www/html/index.html
    EOF  
}