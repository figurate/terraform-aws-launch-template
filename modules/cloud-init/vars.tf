variable "name" {
  description = "Name to associate with the launch template"
}

variable "image_id" {
  description = "AMI image identifier"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "iam_instance_profile" {
  description = "Name of IAM instance profile associated with launched instances"
  default     = null
}

variable "security_groups" {
  description = "List of security group names to attach"
  default     = []
}

// Cloud-init variables..

variable "packages" {
  description = "A list of packages to install with cloud-init"
  default     = []
}

variable "timezone" {
  description = "Default timezone for EC2 instances"
  default     = "UTC"
}

variable "ntp_servers" {
  description = "A list of NTP servers used for time synchronization"
  default     = []
}

variable "users" {
  description = "A list of regular user config"
  type        = list(tuple([string, string, string]))
  default     = []
}

variable "sudo_users" {
  description = "A list of sudo user configs"
  type        = list(tuple([string, string, string]))
  default     = []
}

variable "write_files" {
  description = "A list of files to configure via cloud-init (path, content)"
  type        = list(tuple([string, string]))
  default     = []
}

variable "mounts" {
  description = "A list of filesystem mounts configured via cloud-init"
  type        = list(tuple([string, string, string, string, number, number]))
  default     = []
}

variable "swap_maxsize" {
  description = "Maximum size (bytes) of swapfile (zero to disable swap)"
  type        = number
  default     = 0
}

variable "runcmd" {
  description = "A list of commands to run on first boot"
  type        = list(string)
  default     = []
}
