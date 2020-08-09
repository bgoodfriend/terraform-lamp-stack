# terraform-lamp stack
This is an example of a highly available web server made by launching 2 auto scaling groups of ec2's all zones in a region.  The payload in the ec2's is a LAMP Stack (Linux, Apache, MySQL, PHP).  

This solution was created a a proof of concept for a prospective employer.  It demostrates implementation of all of the following technologies:
Terraform for AWS
AWS: Elastic Load Balancers, Auto Scaling Groups, automatically deployed E2's, a basic launch configuration, and appropriate security groups.
i
## Background

For terraform I forked HashiCorp's cookbook for auto scaling groups:
https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples/asg

For LAMP layout I followed AWS's suggested best practice: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html

## Potential extensions

This example's purpose was to create a LAMP stack.  For improving HA/Scalability, a next step would be to separate the database into an RDS.  Read replicas could be scaled or made available across-region. 

Additionally, the stack could be deployed in multiple regions, behind Route 53. 

Additionally, rather than serve solely on port 80, this template should add SSL/TLS before production.  A procedure for doing so is described here: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/SSL-on-amazon-linux-2.html
