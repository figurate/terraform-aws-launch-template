data "template_file" "ecs_optimized" {
  template = <<EOF
#!/bin/bash
echo 'ECS_CLUSTER=$${ClusterName}' >> /etc/ecs/ecs.config
EOF
  vars = {
    ClusterName = var.template_context["ClusterName"]
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
    ClusterName = var.template_context["ClusterName"]
  }
}

data "template_file" "cloud-init-al2" {
  template = file("${path.module}/templates/cloud-init/al2.yml")
  vars = {
    TimeZone = var.template_context["TimeZone"]
  }
}

data "template_file" "cloud-init-ubuntu" {
  template = file("${path.module}/templates/cloud-init/ubuntu.yml")
  vars = {
    TimeZone = var.template_context["TimeZone"]
  }
}
