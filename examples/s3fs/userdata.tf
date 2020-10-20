data "template_file" "s3fs" {
  template = <<EOF
#!/bin/bash
sudo amazon-linux-extras install epel
sudo yum install -y s3fs-fuse

echo '$${FSMounts}' >> /etc/fstab

mkdir -p $${MountTargets}
mount -a
EOF
  vars = {
    MountTargets = join(" ", [for b in var.buckets : b[1]])
    FSMounts     = join("\n", [for b in var.buckets : "${b[0]} ${b[1]} fuse.s3fs _netdev,allow_other,iam_role=auto 0 0"])
  }
}
