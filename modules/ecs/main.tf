data "aws_caller_identity" "current" {}

data "aws_ami" "image" {
  filter {
    name   = "name"
    values = [var.image]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
  most_recent = true
  owners      = [replace(var.image_owner, "/\\A\\z/", data.aws_caller_identity.current.account_id)]
}

module "launch_template" {
  source = "../.."

  name                 = var.name
  user_data            = base64encode(local.userdata[var.template_type])
  image_id             = data.aws_ami.image.image_id
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  security_groups      = var.security_groups
}
