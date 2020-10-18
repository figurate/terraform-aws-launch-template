data "template_file" "cloud_init" {
  template = file("${path.module}/cloud-init.yml")
  vars = {
    TimeZone             = var.timezone
    AuthorizedUserName   = "ec2-user"
    AuthorizedUserSSHKey = ""
    Hostname             = "al2.example"
  }
}
