/**
 * # ![AWS](aws-logo.png) Launch Template
 *
 * Purpose: Blueprints for AWS Launch Templates.
 */
data "aws_caller_identity" "current" {}

data "aws_ami" "image" {
  filter {
    name   = "name"
    values = [var.image_name]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
  most_recent = true
  owners      = [replace(var.image_owner, "/\\A\\z/", data.aws_caller_identity.current.account_id)]
}

resource "aws_launch_template" "launch_template" {
  image_id      = data.aws_ami.image.id
  instance_type = var.instance_type
  user_data     = base64encode(local.user_data[var.template_type])

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
      Name = ""
    }
  }
}
