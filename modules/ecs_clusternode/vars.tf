variable "name" {
  description = "Name to associate with the launch template"
}

variable "template_type" {
  description = "A predefined template type used to configure user data, etc."
  default     = "ecs_optimized"
}

variable "cluster_name" {
  description = "Name of the ECS cluster the node belongs to"
}

variable "image" {
  description = "Predefined filter for EC2 AMI"
  default     = "ecs-optimized"
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
  default     = "ecs-clusternode-instanceprofile"
}

variable "security_groups" {
  description = "List of security group names to attach"
  default     = []
}
