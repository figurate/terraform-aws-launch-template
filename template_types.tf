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
