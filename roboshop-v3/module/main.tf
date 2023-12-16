resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.id
  instance_type = var.Instance_type
  vpc_security_group_ids = var.Security_group

  tags    = {
    Name = var.name
  }
}

resource "aws_route53_record" "record" {
  zone_id       = var.zone_id
  name          = "${var.name}.msahu.online"
  type          = "A"
  ttl           = 30
  records       = [aws_instance.instance.private_ip]
}



