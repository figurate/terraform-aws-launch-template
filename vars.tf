variable "name" {
  description = "Name to associate with the launch template"
}

variable "user_data" {
  description = "Encoded user data"
  default     = null
}

variable "image_id" {
  description = "AMI image identifier"
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

variable "associate_public_ip_address" {
  description = "Allocation a public IP address (required for Internet access)"
  default     = true
}

variable "metadata_v2" {
  description = "Enforce metadata version 2"
  default     = true
}
