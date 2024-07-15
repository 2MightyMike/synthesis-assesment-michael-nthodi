variable "region" {
  description = "The AWS region to deploy in"
  default     = "us-west-1"
}

variable "availability_zone" {
  description = "The availability zone to deploy in"
  default     = "us-west-1a"
}

variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
}

variable "instance_type" {
  description = "The type of instance to deploy"
  default     = "t2.micro"
}
