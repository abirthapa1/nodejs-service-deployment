terraform {
  required_version = ">=0.15.0, < 2.0.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>4.0"
    }
  }
}


data "aws_ssm_parameter" "nodejs-ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_security_group" "Node-Js-SG" {
    name = "Node Js SG"
    description = "Allow HTTP traffic"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}

resource "aws_key_pair" "nodejs_keypair" {
  key_name = "Node_Js"
  public_key = file(var.ssh_key_public)
}

resource "aws_instance" "Node_Js" {
    ami = data.aws_ssm_parameter.nodejs-ami.value
    instance_type = "t2.micro"

    tags = {
      Name = "Node Js server"
    }

    key_name = aws_key_pair.nodejs_keypair.key_name
    associate_public_ip_address = true

    #security group configuration
    vpc_security_group_ids = [ aws_security_group.Node-Js-SG.id ]

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file(var.ssh_key_private)
      host = self.public_ip
    }
    provisioner "remote-exec" {
      inline = [ 
        "sudo yum update -y && sudo amazon-linux-extras install ansible2 -y",
        "sleep 60s"
       ]
    }
}