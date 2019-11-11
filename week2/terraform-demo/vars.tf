variable "AWS_REGION" {
  default = "ap-southeast-1"
}
variable "AMIS" {
  type = "map"
  default = {
    ap-southeast-1 = "ami-0ee0b284267ea6cde"
  }
}

