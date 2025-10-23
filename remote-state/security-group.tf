resource "aws_security_group" "allow-all" {
    name   = var.sg-name
    
    egress {
        from_port   = var.egress-from-port # from port 0 to to port 0 means all ports
        to_port     = var.egress-to-port
        protocol    = var.egress-protocol # -1 means all protocols
        cidr_blocks = var.egress-cidr-blocks # internet
    }
    dynamic "ingress" {
      for_each = toset(var.ingress-ports) 
      content {
        from_port   = ingress.value.from_port
        to_port     = ingress.value.to_port
        protocol    = "tcp" 
        
        #var.ingress-protocol # -1 means all protocols
        cidr_blocks = var.ingress-cidr-blocks # internet
      }
    }
   
    tags = {
        Name = var.sg-name
    }
  
}