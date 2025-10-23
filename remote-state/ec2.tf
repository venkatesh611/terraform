resource "aws_instance" "terraform" {
    ami           = local.ami-id
    instance_type = local.instance-type
    vpc_security_group_ids = [aws_security_group.allow-all.id]
    tags = var.common-ec2-tags
  
}