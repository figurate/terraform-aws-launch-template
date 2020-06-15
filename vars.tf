variable "name" {
  description = "Name to associate with the launch template"
}

variable "template_type" {
  description = "A predefined template type used to configure user data, etc."
}

variable "template_context" {
  description = "Additional contextual values relevant to the template user data"
  type        = map(string)
  default     = {}
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
  default     = null
}

variable "security_groups" {
  description = "List of security group names to attach"
  default     = []
}

locals {
  user_data = {
    ecs-optimized           = data.template_file.ecs_optimized.rendered
    ecs-optimized-spotfleet = data.template_file.ecs_optimized_spotfleet.rendered

    cloud-init-al2    = data.template_file.cloud-init-al2.rendered
    cloud-init-ubuntu = data.template_file.cloud-init-ubuntu.rendered
  }

  images = {
    ecs-optimized           = "amzn2-ami-ecs-hvm-2.0.????????-x86_64-ebs"
    ecs-optimized-spotfleet = "amzn2-ami-ecs-hvm-2.0.????????-x86_64-ebs"
  }
}
