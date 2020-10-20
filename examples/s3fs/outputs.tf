output "user_data" {
  value = data.template_file.s3fs.rendered
}
