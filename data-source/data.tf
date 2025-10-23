data "aws_ami" "jiondevops"{
most_recent = true
owners      = ["973714476881"]

filter {
name   = "name"
values = ["RHEL-9-DevOps-Practice"]
}
filter {
name   = "root-device-type"
values = ["ebs"]
}
filter {
name   = "virtualization-type"
values = ["hvm"]
}
}
output "ami_id" {
  value = data.aws_ami.jiondevops.id
}
data "aws_instance" "example" {
  instance_id = "i-03463ba3496f6091b"
}
output "instance_public_ip" {
  value = data.aws_instance.example.public_ip
}
output "instance_private_ip" {
  value = data.aws_instance.example.private_ip
}