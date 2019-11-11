resource "aws_key_pair" "mykeypair" {
  key_name   = "my_key"
  public_key = "${file("./keys/appkey.pub")}"
}
