# terraform-lamp-stack
This is an example of a highly available web server made by launching an auto scaling group of ec2's all zones in a region.  The payload in the ec2's is a LAMP Stack.

This solution was created a a proof of concept for a prospective employer.  It demostrates implementation of all of the following technologies:
- Terraform for AWS
- AWS: Elastic Load Balancers, Auto Scaling Groups, automatically deployed E2's, a basic launch configuration, and appropriate security groups.
- LAMP:
  - Linux: Latest Amazon Linux 2 AMI (HVM), SSD Volume Type
  - Apache
  - Mysql: MariaDB
  - PHP

## Deployment Procedure
1. Install Terraform. 
   https://learn.hashicorp.com/tutorials/terraform/install-cli

2. Configure variables.tf file as needed.

3. Consider changing root password for embedded MariaDB.  Edit userdata.sh

4. terraform init

5. terraform plan

6. terraform apply

It may take several minutes after launch for AWS to initialize all portions.  After that, your site should be available at your LB's URL, which will be printed in terraform's outputs.  Examples

http://{your elb url}/
http://{your elb url}/phpinfo.php

Fun example this is working: Both of these pages display the ip of the application system.  If you kept the default and deployed 2 LAMP stacks, you can "flip a coin" by reloading each page and watching the IP change.

## Background

For terraform I forked HashiCorp's cookbook for auto scaling groups:
https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples/asg

For LAMP layout I followed AWS's suggested best practice: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html

## Potential extensions

This example's purpose was to create a LAMP stack.  For improving HA/Scalability, a next step would be to separate the database into an RDS.  Read replicas could be scaled or made available across-region.  Seaparating the database would open this stack to other scaling technologies, eg CloudFront.

Additionally, the stack could be deployed in multiple regions, behind Route 53. 

Additionally, rather than serve solely on port 80, this template should add SSL/TLS before production.  A procedure for doing so is described here: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/SSL-on-amazon-linux-2.html
