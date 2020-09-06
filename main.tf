/**
 * # ![AWS](aws-logo.png) Launch Template
 *
 * Purpose: Blueprints for AWS Launch Templates.
 */
data "aws_caller_identity" "current" {}

data "aws_ami" "image" {
  filter {
    name   = "name"
    values = [local.images[var.image]]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
  most_recent = true
  owners      = [replace(var.image_owner, "/\\A\\z/", data.aws_caller_identity.current.account_id)]
}

data "aws_security_group" "security_groups" {
  count = length(var.security_groups)
  filter {
    name   = "tag:Name"
    values = [var.security_groups[count.index]]
  }
}

resource "aws_launch_template" "launch_template" {
  name_prefix   = "${var.name}-"
  image_id      = data.aws_ami.image.id
  instance_type = var.instance_type
  user_data     = base64encode(local.user_data[var.template_type])

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = data.aws_security_group.security_groups.*.id
  }

  dynamic "iam_instance_profile" {
    for_each = var.iam_instance_profile != null ? [1] : []
    content {
      name = var.iam_instance_profile
    }
  }

  vpc_security_group_ids = []

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.name
    }
  }

  metadata_options {
    http_tokens = "required"
  }
}
