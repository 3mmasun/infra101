resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  #vpc subnet
  subnet_id = "${aws_subnet.infra_public.id}"
  #security group
  vpc_security_group_ids = ["${aws_security_group.allow_ssh_http_http.id}"]
  #public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"
  tags = {
    Name = "HelloInfra101"
  }
}

resource "aws_elb" "web" {
  name = "terraform-example-elb"

  subnets         = ["${aws_subnet.infra_public.id}"]
  security_groups = ["${aws_security_group.allow_ssh_http.id}"]
  instances       = ["${aws_instance.example.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
