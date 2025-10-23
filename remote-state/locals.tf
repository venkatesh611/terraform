locals {
  common-name="${var.project-name}-${var.env}"
  common-tags=merge(
        var.common-ec2-tags,
        {
        Project = var.project-name
        Env     = var.env
        }
    )
 ami-id=data.aws_ami.jiondevops.id
 instance-type=var.instance-type

}