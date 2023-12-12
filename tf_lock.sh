#!/bin/bash
#Locking script
  echo "Please enter password for encription:"
  read TF_PASSWORD
  openssl aes-256-cbc -pass pass:$TF_PASSWORD -e -salt -pbkdf2 -in terraform.tfstate -out terraform.tfstate.enc
  openssl aes-256-cbc -pass pass:$TF_PASSWORD -e -salt -pbkdf2 -in terraform.tfvars -out terraform.tfvars.enc
  rm terraform.tfstate
  rm terraform.tfvars
  echo "Done"
