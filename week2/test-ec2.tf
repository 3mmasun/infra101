provider "aws" {
  profile = "emma"
  region  = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0ee0b284267ea6cde"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloInfra101"
  }
}
