data "template_file" "ecs_optimized" {
  template = <<EOF
#!/bin/bash
echo 'ECS_CLUSTER=$${ClusterName}' >> /etc/ecs/ecs.config
EOF
  vars = {
    ClusterName = var.cluster_name
  }
}

data "template_file" "ecs_optimized_spotfleet" {
  template = <<EOF
#!/bin/bash
echo 'ECS_CLUSTER=$${ClusterName}' >> /etc/ecs/ecs.config

yum install -y hibagent
/usr/bin/enable-ec2-spot-hibernation
EOF
  vars = {
    ClusterName = var.cluster_name
  }
}

locals {
  userdata = {
    ecs-optimized           = data.template_file.ecs_optimized.rendered
    ecs-optimized-spotfleet = data.template_file.ecs_optimized_spotfleet.rendered
  }
}
