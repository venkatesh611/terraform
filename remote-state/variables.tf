variable "project-name" {
    description = "The name of the project"
    type        = string
    default     = "roboshop" 
}
variable "env" {
    description = "The environment name"
    type        = string
    default     = "dev"
}
variable "bucket-name" {
    description = "The name of the S3 bucket to store the remote state"
    type        = string
    default     = "terraform-86s-bucket"
}
variable "region"  {
    description = "The AWS region to deploy resources in"
    type        = string
    default     = "us-east-1"
}

#ec2 related variables
variable "instances" {
    description = "A list of EC2 instance names"
    type        = list(string)
    default     = ["web-1", "web-2", "web-3"]
}
variable "instance-type" {
    description = "The type of EC2 instance"
    type        = string
    default     = "t3.micro"
}
variable "common-ec2-tags" {
    description = "A map of tags to assign to EC2 instances"
    type        = map(string)
    default     = {
        
        Environment = "dev"
        Project     = "roboshop"
        Terraform   = "true"
    }
}
#security group related variables
variable "sg-name" {
    description = "The name of the security group"
    type        = string
    default     = "allow-all-roboshop"
}
variable "ingress-from-port" {
     default = 0
}
variable "ingress-to-port" {
     default = 0
}
variable "ingress-protocol" {
     default = "-1"
}
variable "ingress-cidr-blocks" {
     default = ["0.0.0.0.0/0"]
}
variable "egress-from-port" {
     default = 0
}
variable "egress-to-port" {
     default = 0
}
variable "egress-protocol" {
     default = "-1"
}
variable "egress-cidr-blocks" {
     default = ["0.0.0.0/0"]
}
variable "ingress-ports" {
    description = "A list of ingress ports"
    type        = list(number)
    default     = [22, 80, 8080, 3306]
  
}





