## aws-terraform
The objective of this repo is to set up the environment in order to deploy AWS resources using Terraform.

## Configure the environment
### Pre-requisites
* Have an [AWS account]()
* Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli) and [AWS CLI]()<br>
Note: We will be using [Windows WSL](https://code.visualstudio.com/docs/remote/wsl-tutorial) CLI in VS Code

### 1. Authenticate to the AWS Account
* See [user-login.md]() for details on how to deploy resources in **AWS** using Terraform and user login from CLI.
### 2. Use GitHub Action - A pipeline
* See [aws-login.md]() for details on how to deploy resources in **AWS** using Terraform and GitHub Action.

### Sources
1. [Find AMI here](https://cloud-images.ubuntu.com/locator/ec2/)
2. [How to Create AWS EC2 Instance Using Terraform](https://spacelift.io/blog/terraform-ec2-instance)
3. [Deploy Ubuntu EC2 in AWS using Terrafor](https://gmusumeci.medium.com/how-to-deploy-an-ubuntu-linux-ec2-instance-in-aws-using-terraform-330199d93dd8)
