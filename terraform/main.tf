provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "my-server" {
  ami           = var.ami # Ubuntu 22.04 LTS (Paris)
  instance_type = var.instance_type
  key_name      = var.key_name
  associate_public_ip_address = true
  security_groups = [aws_security_group.k3s_sg.name]

  tags = {
    Name = "devsecops-k3s"
  }

  provisioner "remote-exec" {
    inline = [
      " apt-get install docker.io -y "
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.pem_path}") # La clé privée est la .pem
      host        = self.public_ip
    }
  }
}

resource "aws_security_group" "k3s_sg" {
  tags = {
    Name = "k3s-allow"
  }

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
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 80
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
}

egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

