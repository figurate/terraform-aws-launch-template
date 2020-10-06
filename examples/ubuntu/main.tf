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

data "template_file" "cloud_init" {
  template = file("${path.module}/cloud-init.yml")
  vars = {
    TimeZone             = var.timezone
    AuthorizedUserName   = "ubuntu"
    AuthorizedUserSSHKey = ""
  }
}

module "launch_template" {
  source = "../.."

  name                 = var.name
  user_data            = base64encode(data.template_file.cloud_init.rendered)
  image_id             = data.aws_ami.image.image_id
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  security_groups      = var.security_groups
}
