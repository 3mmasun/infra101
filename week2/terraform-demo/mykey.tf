resource "aws_key_pair" "mykeypair" {
  key_name   = "appkey"
  public_key = "${file("keys/appkey.pub")}"
}