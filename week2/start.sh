#!bash
mkdir terraform-demo
cd terraform
terraform init
mkdir keys
ssh-keygen -t rsa -b 4096 -C "infra@ubuntu" -N '' -f ./keys/appkey
