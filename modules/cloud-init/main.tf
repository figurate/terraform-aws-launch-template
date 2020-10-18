module "launch_template" {
  source = "../.."

  name                 = var.name
  user_data            = data.template_file.cloud_init.rendered
  image_id             = var.image_id
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  security_groups      = var.security_groups
}
