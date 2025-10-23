variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
  default     = "ami-09c813fb71547fc4f"
  
}
variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t3.micro"
}
variable "sg_name" {
    description = "The name of the security group"
    type        = string
    default     = "allow-all"
}
variable "tags" {
    description = "A map of tags to assign to the resource"
    type        = map(string)
    default     = {
        Name      = "terraform"
        Terraform = "true"
    }
  
}
variable "ingress_from_port" {
     default = 0
}
variable "ingress_to_port" {
     default = 0
}
variable "ingress_protocol" {
     default = "-1"
}
variable "ingress_cidr_blocks" {
     default = ["0.0.0.0/0"]
}
variable "egress_from_port" {
     default = 0
}
variable "egress_to_port" {
     default = 0
}
variable "egress_protocol" {
     default = "-1"
}
variable "egress_cidr_blocks" {
     default = ["0.0.0.0/0"]
}


variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}
