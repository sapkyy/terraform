#!/bin/bash
#Unlocking script
  echo "Please enter password for decription:"
  read TF_PASSWORD
  openssl aes-256-cbc -pass pass:$TF_PASSWORD -d -salt -pbkdf2 -in terraform.tfstate.enc -out terraform.tfstate
  openssl aes-256-cbc -pass pass:$TF_PASSWORD -d -salt -pbkdf2 -in terraform.tfvars.enc -out terraform.tfvars
  echo "Done"
