/**
 * # ![AWS](aws-logo.png) Launch Template
 *
 * ![AWS Launch Template](aws_launch_template.png)
 *
 * Purpose: Blueprints for AWS Launch Templates.
 */
data "aws_security_group" "security_groups" {
  count = length(var.security_groups)
  filter {
    name   = "tag:Name"
    values = [var.security_groups[count.index]]
  }
}

resource "aws_launch_template" "launch_template" {
  name_prefix   = "${var.name}-"
  image_id      = var.image_id
  instance_type = var.instance_type
  user_data     = base64encode(var.user_data)

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
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

  #checkov:skip=CKV_AWS_79:Default requires metadata v2
  metadata_options {
    http_tokens = var.metadata_v2 ? "required" : "optional"
  }
}
