variable "name" {
  description = "Name to associate with the launch template"
  default     = "ubuntu"
}

variable "image" {
  description = "Name filter for EC2 AMI"
  default     = "amzn2-ami-ecs-hvm-2.0.????????-x86_64-ebs"
}

variable "image_owner" {
  description = "AMI image owner (leave blank for current account)"
  default     = "591542846629"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "iam_instance_profile" {
  description = "Name of IAM instance profile associated with launched instances"
  default     = null
}

variable "security_groups" {
  description = "List of security group names to attach"
  default     = []
}

variable "timezone" {
  description = "Default timezone for EC2 instances"
  default     = "UTC"
}
