module "launch_template" {
  source = "../.."

  template_type = var.template_type
  template_context = {
    ClusterName = var.cluster_name
  }
  image_name           = var.image_name
  image_owner          = var.image_owner
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
}
