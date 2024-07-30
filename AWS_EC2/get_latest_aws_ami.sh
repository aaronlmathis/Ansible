#!/bin/sh

# List of US regions
regions="us-east-1 us-east-2 us-west-1 us-west-2"

# Function to get the latest AMI ID for a region
get_latest_ami() {
  region=$1
  ami_id=$(aws ec2 describe-images \
    --region $region \
    --owners amazon \
    --filters "Name=name,Values=RHEL-9*-x86_64-HVM-*" \
    --query "Images | sort_by(@, &CreationDate) | [-1].ImageId" \
    --output text)
  echo "Latest AMI ID for Red Hat Enterprise Linux 9 (HVM) in $region: $ami_id"
}

# Iterate over each region and get the latest AMI ID
for region in $regions; do
  get_latest_ami $region
done
