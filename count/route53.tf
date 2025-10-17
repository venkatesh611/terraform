resource "aws_route53_record" "roboshop" {
  count=length(var.instances)
  zone_id = var.hosted_zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true
}