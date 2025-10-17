resource "aws_instance" "terraform" {
    ami=var.ami_id
    
    count = length(var.instances)
    instance_type=var.instance_type
    vpc_security_group_ids = [aws_security_group.allow-all.id]
    tags = merge(
  var.tags,
  { Name = var.instances[count.index] }
)
}
resource "aws_security_group"  "allow-all" {
    name   = var.sg_name
    egress {
        from_port        = var.egress_from_port # from port 0 to to port 0 means all ports
        to_port          = var.egress_to_port
        protocol         = var.egress_protocol # -1 means all protocols
        cidr_blocks      = var.egress_cidr_blocks # internet

    }
    ingress {
        from_port        = var.ingress_from_port # from port 0 to to port 0 means all ports
        to_port          = var.ingress_to_port
        protocol         = var.ingress_protocol # -1 means all protocols
        cidr_blocks      = var.ingress_cidr_blocks # internet
    }
    tags = {
        Name = var.sg_name
    }

}

