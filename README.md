# AWS Hands-on Labs

Hello and welcome to the AWS Hands-on labs. Before start there are some steps to run:

1. Set-up an AWS Account

    https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/


1. Let's install the AWS CLI 

    * For Mac and Linux users:
      
        Requires [Python](http://www.python.org/download/) 2.6.5 or higher. Install using 
        [pip](http://www.pip-installer.org/en/latest/).
        
        ```
        pip install awscli
        ```

    * For Windows users:
      
        Download and run the [64-bit](https://s3.amazonaws.com/aws-cli/AWSCLI64.msi) or 
        [32-bit](https://s3.amazonaws.com/aws-cli/AWSCLI32.msi) Windows installer
        

    For more information https://aws.amazon.com/cli/
      

1. Install Git

    Sometimes will be easier if you just clone this repo, instead of copying the files. 
    Having the git installed is not a mandatory requisite, but it may help you.
    
    Download and install here: https://git-scm.com/downloads You can have more information 
about git here: https://git-scm.com/book/en/v1/Getting-Started
      

1. If you are using a Windows machine...

We strongly recommend you to spin up a Linux EC2 instance. None of these labs were even 
tested in Windows environments.


1. Now let's get our hands dirty

* IAM:
  * Creating IAM Users and Groups
  * Managing IAM Users Permissions and Credentials
  * IAM Roles for EC2

* EC2:
  * Creating Key Pairs
  * Launch a Web Server Instance
  
* ELB:
  * Creating an ELB

* AUTO SCALING:
  * Create a new launch configuration
  * Create your Auto Scaling Group

* EBS:
	* Create and attach EBS Volume
  * Run a Disk-heavy workload
  * Modify EBS Volume Attributes
  * Cleanup
  
* S3:
  * Create a Bucket in S3
  * Add an Object to a Bucket
  * View an Object
  * Move an Object
  * Enable Bucket Versioning
  * Delete an Object and Bucket

* VPC:
  * Launch VPC Instances
  * Public Subnet
  * Private Subnet
  * Security Groups
  * Endpoints
  
* DYNAMODB:
  * Creating Table
  * Creating Index
  * Query data
  
* ELASTICACHE:
  * Creating a cluster

* CLOUDFORMATION:
  * Create a stack
  * Deploy a stack
  * Update a stack
  
* LAMBDA:
  * Create a function