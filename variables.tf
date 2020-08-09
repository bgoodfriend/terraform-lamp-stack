variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

# Latest Amazon Linux 2 AMI (HVM), SSD
variable "aws_amis" {
  default = {
    "us-east-1" = "ami-02354e95b39ca8dec"
    "us-east-2" = "ami-07c8bc5c1ce9598c3"
    "us-west-1" = "ami-05655c267c89566dd"
    "us-west-2" = "ami-05655c267c89566dd"
  }
}

variable "availability_zones" {
  default     = "us-east-1b,us-east-1c,us-east-1d,us-east-1e"
  description = "List of availability zones, use AWS CLI to find your "
}

variable "key_name" {
  description = "Name of AWS key pair"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "AWS instance type"
}

variable "asg_min" {
  description = "Min numbers of servers in ASG"
  default     = "1"
}

variable "asg_max" {
  description = "Max numbers of servers in ASG"
  default     = "5"
}

variable "asg_desired" {
  description = "Desired numbers of servers in ASG"
  default     = "2"
}
