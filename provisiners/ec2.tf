resource "aws_instance" "terraform" {
    ami           = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = var.tags
    provisioner "local-exec" {
      command = "echo Instance ${self.id} with IP ${self.public_ip} has been created"
      on_failure = continue
    }
    provisioner "local-exec" {
      command = "instance_id=${self.id} was deleted"
      when    = destroy
    }
    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
    }
    provisioner "remote-exec" {
      inline = [
        "sudo dnf update -y",
        "sudo dnf install -y nginx",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"
      ]
    }
    provisioner "remote-exec" {
      inline = [ "sudo systemctl stop nginx" ]
      when   = destroy
    }
  
}
resource "aws_security_group" "allow_all" {
    name        = var.sg_name
    description = "Security group to allow all inbound and outbound traffic"
  
    ingress {
        from_port   = var.ingress_from_port
        to_port     = var.ingress_to_port
        protocol    = var.ingress_protocol
        cidr_blocks = var.ingress_cidr_blocks
    }
  
    egress {
        from_port   = var.egress_from_port
        to_port     = var.egress_to_port
        protocol    = var.egress_protocol
        cidr_blocks = var.egress_cidr_blocks
    }
  
    tags = var.tags
  
}