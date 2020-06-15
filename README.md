# Overview
This repository is meant to host a few sample applications that will leverage AWS serverless framework. It is only meant to be for my knowledge and understanding of these services

# Get Started
Since the code here will be using AWS services, you will obviously need an AWS account. All the services here will be created via Terraform for easy management and the terraform code can be found in the [terraform](./terraform) directory

## Pre-requisites
1. AWS account
2. Terraform

### Setup environment
Once you have the pre-requisites setup, navigate to the [terraform](./terraform) folder and edit `setup.tf`. Here you will see some configuration for Terraform. Change all references to account_ids to point to your AWS account and all the provider versions as you deem necessary.
The `terraform {}` block in the file is where the state is stored and references a S3 bucket and a DynamoDB key. You must create those beforehand and that is out of scope for this project

# TODO Delete
[ ] Delete API Gateway
[ ] Lambda function cy-*-data
[ ] CloudWatch logs
[ ] DynamoDB table
