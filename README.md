## aws-terraform
The objective of this repo is to set up the environment in order to deploy AWS resources using Terraform.
### Architecture
This architecture is to outline what ia being created.<br>
It is a simple architecture that is not intended to be used in any real work scenario.<br>
This is just to practice provisioning AWS resources using IaC (Terraform).<br><br>
![](aws-tf/images/aws10.PNG)
### Configure the Environment and Deploy
#### Pre-requisites
* Have an [AWS account](https://aws.amazon.com/resources/create-account/)
* Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli) and [AWS CLI]()<br>
**Note**: We will be using [Windows WSL](https://code.visualstudio.com/docs/remote/wsl-tutorial) CLI in VS Code<br>
#### 1. Authenticate to the AWS Account - Using the CLI
* Create AWS [access keys](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-iam-create-creds.html) for the IAM user
* Install the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) on your host 
* On your terminal, run `aws configure` - it should look like this:<br>
![](aws-tf/images/aws1.PNG)
* Then, create the folder structure and write your Terraform codes to create the EC2
* This is the folder structure I have for this case - some files are missing (see `.gitignore` file)<br>
![](aws-tf/images/aws2.PNG)
* Create your [ssh key pairs](https://ercanermis.com/creating-ssh-keys-for-secure-access-to-aws-ec2-instances-with-terraform/) from your local machine
* Make sure to copy the public key pair to the EC2 from the Terraform code - see `security.tf` file
* Once files are ready, run `terraform init` to initialize the environment<br>
![](aws-tf/images/aws3.PNG)
* Run `terraform plan` - it should show you what will be created<br>
![](aws-tf/images/aws4.PNG)
* Finally, run `terraform apply --auto-approve` to create the resources<br>
![](aws-tf/images/aws5.PNG)
* You can see on the portal that the instance with the ID `i-01347b7200e15547a` was created<br>
![](aws-tf/images/aws6.PNG)
* Now [ssh](https://cloudinfrastructureservices.co.uk/how-to-create-linux-aws-ec2-instance-using-terraform/) to the EC2 created - make sure to specify the pathe to the private key<br>
    * Run the command `sudo ssh -i "/path/to/private/key/pair/you/created/<key_name>" <username>@<public_ip>`
    ![](aws-tf/images/aws7.PNG)
    * We can also access the NGINX server we (EC2) - just put the public IP address to the browser.
    ![](aws-tf/images/aws9.PNG)
* Clean up to avoid charges - run `terraform destroy --auto-approve`<br>
![](aws-tf/images/aws8.PNG)
* See [Terraform CLI](https://developer.hashicorp.com/terraform/cli/commands) for more Terraform commands.<br><br>
#### 2. Use GitHub Action - A pipeline
*in Progress...*

#### Sources
1. [Find an Ubuntu AMI here](https://cloud-images.ubuntu.com/locator/ec2/)
6. [Open/Close port in Windows](https://www.liquidweb.com/kb/open-a-port-in-windows-firewall/)
