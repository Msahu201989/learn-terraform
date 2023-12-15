variable "ami" {
  default = "ami-03265a0778a880afb"
}
variable "Security_group" {
  default = [ "sg-061a8bc865ac300c4" ]
}

variable "Instance_type" {
  default = "t2.micro"
}

variable "Zone_ID" {
  default = "Z03012723POIVATFERQS2"
}

resource "aws_instance" "frontend" {
  ami           = var.ami
  instance_type = var.Instance_type
  vpc_security_group_ids = var.Security_group

  tags   = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = var.Zone_ID
  name    = "frontend.msahu.online"
  type    = "A"
  records = [aws_instance.frontend.private_ip]
}


resource "aws_instance" "mongodb" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-061a8bc865ac300c4" ]

  tags   = {
    Name = "mongodb"
  }
}
resource "aws_route53_record" "mongodb" {
  zone_id = "Z03012723POIVATFERQS2"
  name    = "frontend.msahu.online"
  type    = "A"
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-061a8bc865ac300c4" ]

  tags   = {
    Name = "catalogue"
  }
}
resource "aws_route53_record" "catalogue" {
  zone_id = "Z03012723POIVATFERQS2"
  name    = "frontend.msahu.online"
  type    = "A"
  records = [aws_instance.catalogue.private_ip]
}


resource "aws_instance" "cart" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-061a8bc865ac300c4" ]

  tags   = {
    Name = "cart"
  }
}
resource "aws_route53_record" "cart" {
  zone_id = "Z03012723POIVATFERQS2"
  name    = "frontend.msahu.online"
  type    = "A"
  records = [aws_instance.cart.private_ip]
}


resource "aws_instance" "redis" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-061a8bc865ac300c4" ]

  tags   = {
    Name = "redis"
  }
}
resource "aws_route53_record" "redis" {
  zone_id = "Z03012723POIVATFERQS2"
  name    = "frontend.msahu.online"
  type    = "A"
  records = [aws_instance.redis.private_ip]
}


resource "aws_instance" "user" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-061a8bc865ac300c4" ]

  tags   = {
    Name = "user"
  }
}
resource "aws_route53_record" "user" {
  zone_id = "Z03012723POIVATFERQS2"
  name    = "frontend.msahu.online"
  type    = "A"
  records = [aws_instance.user.private_ip]
}


resource "aws_instance" "mysql" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-061a8bc865ac300c4" ]

  tags   = {
    Name = "mysql"
  }
}
resource "aws_route53_record" "mysql" {
  zone_id = "Z03012723POIVATFERQS2"
  name    = "frontend.msahu.online"
  type    = "A"
  records = [aws_instance.mysql.private_ip]
}


resource "aws_instance" "shipping" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-061a8bc865ac300c4" ]

  tags   = {
    Name = "shipping"
  }
}
resource "aws_route53_record" "shipping" {
  zone_id = "Z03012723POIVATFERQS2"
  name    = "frontend.msahu.online"
  type    = "A"
  records = [aws_instance.shipping.private_ip]
}


resource "aws_instance" "rabbitmq" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-061a8bc865ac300c4" ]

  tags   = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z03012723POIVATFERQS2"
  name    = "frontend.msahu.online"
  type    = "A"
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-061a8bc865ac300c4" ]

  tags   = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z03012723POIVATFERQS2"
  name    = "frontend.msahu.online"
  type    = "A"
  records = [aws_instance.payment.private_ip]
}
