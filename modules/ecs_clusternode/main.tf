module "launch_template" {
  source = "../.."

  name          = var.name
  template_type = var.template_type
  template_context = {
    ClusterName = var.cluster_name
  }
  image                = var.image
  image_owner          = var.image_owner
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  security_groups      = var.security_groups
}
