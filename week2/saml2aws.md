## OKTA saml authentication to aws

Reference:

- [saml2aws](https://github.com/Versent/saml2aws)
- [how-to-video](https://drive.google.com/file/d/1-6x_7-vkd19Sblq7lgNvhnMIiyZIlj6K/view)

```bash
# install 2 libraries
brew tap versent/homebrew-taps
brew install saml2aws

# initial configuration for saml2aws
saml2aws configure
  >> Okta
  >> push
  >> profile emma
  >> url of the “aws beach” chicklet from okta homepage
  >> username
  >> password

# login aws
saml2aws login

# test
cat ~/.aws/credentials
# [emma]
# aws_access_key_id      = xxxx
# aws_secret_access_key  = xxxx
# aws_session_token      = xxxx
# ...

# ~/.aws/credentials is valid for 1 hour
```

## Create EC2 instance on AWS using the credentials

```
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
```
