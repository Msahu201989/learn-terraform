resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"

 root_block_device {
    volume_size = 15
  }

  tags   = {
    Name = "Test"
  }
}




