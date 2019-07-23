#!/usr/bin/env bash

# get Terraform latest version
tf_latest_version=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M ".current_version")

# get Operaing System
os_name=$(uname | tr '[:upper:]' '[:lower:]')

# Download Terraform latest version
curl --silent --location https://releases.hashicorp.com/terraform/${tf_latest_version}/terraform_${tf_latest_version}_${os_name}_amd64.zip --output /tmp/terraform_linux_amd64.zip

# Install Terraform
unzip -o /tmp/terraform_linux_amd64.zip -d /tmp/terraform_${tf_latest_version}
cp /tmp/terraform_${tf_latest_version}/terraform /usr/local/bin/terraform_${tf_latest_version}

