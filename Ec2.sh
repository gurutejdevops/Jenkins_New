#!/bin/bash

# ---------- VARIABLES ----------
ROLE_ARN="arn:aws:iam::256585468679:role/Terraform-role"
SESSION_NAME="jenkins-session"
REGION="us-east-1"

AMI_ID="ami-0c398cb65a93047f2"
INSTANCE_TYPE="t2.micro"
# KEY_NAME="YOUR_KEYPAIR_NAME"
SECURITY_GROUP="sg-0a9d2be0531ab2dde"
SUBNET_ID="subnet-02347b81b06bf19b4"

# ---------- ASSUME ROLE ----------
echo "Assuming IAM Role..."

CREDENTIALS=$(aws sts assume-role \
  --role-arn $ROLE_ARN \
  --role-session-name $SESSION_NAME \
  --region $REGION \
  --query 'Credentials.[AccessKeyId,SecretAccessKey,SessionToken]' \
  --output text)

echo "Role assumed successfully."

# ---------- CREATE EC2 ----------
echo "Creating EC2 Instance..."

INSTANCE_ID=$(aws ec2 run-instances \
  --image-id $AMI_ID \
  --count 1 \
  --instance-type $INSTANCE_TYPE \
#   --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP \
  --subnet-id $SUBNET_ID \
  --region $REGION \
  --query 'Instances[0].InstanceId' \
  --output text)

echo "EC2 Created Successfully!"
echo "Instance ID: $INSTANCE_ID"
