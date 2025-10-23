resource "aws_instance" "terraform" {
    for_each = toset(var.instances)
    ami           = local.ami-id
    instance_type = local.instance-type
    vpc_security_group_ids = [aws_security_group.allow-all.id]
    tags =merge(
        var.common-ec2-tags,
        { Name = each.value}
    )
  
}