#!/bin/bash
# run secrets.sh to have subscriptions 

# ./secrets.sh 

#Create Application VM
echo 'Installing Application - Robot Shop Single Mode'
cd ./application
terraform init 
terraform apply -auto-approve -var-file=terraform.tfvars -var-file=secret-variables.tfvars -var-file=vm-size.tfvars

terraform output public_ip_address > ../output/application_ip.txt

# #Plan Load Generation VM - With -var
cd .. 
# cd ./load
# echo 'Installing Load Generation For Robot Shop Single Mode'
# terraform init 

# ip_address=$(grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ../output/application_ip.txt)

# echo ${ip_address}
# echo 'Running Apply'
# # terraform plan -var applications_public_ip='${ip_address[0]}'
# terraform apply  -auto-approve -var applications_public_ip='${ip_address[0]}' -var-file=secret-variables.tfvars  -var-file=terraform.tfvars 

# cd ..