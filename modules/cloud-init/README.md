## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| iam\_instance\_profile | Name of IAM instance profile associated with launched instances | `any` | `null` | no |
| image\_id | AMI image identifier | `any` | n/a | yes |
| instance\_type | EC2 instance type | `string` | `"t3.micro"` | no |
| mounts | A list of filesystem mounts configured via cloud-init | `list(tuple([string, string, string, string, number, number]))` | `[]` | no |
| name | Name to associate with the launch template | `any` | n/a | yes |
| ntp\_servers | A list of NTP servers used for time synchronization | `list` | `[]` | no |
| packages | A list of packages to install with cloud-init | `list` | `[]` | no |
| runcmd | A list of commands to run on first boot | `list(string)` | `[]` | no |
| security\_groups | List of security group names to attach | `list` | `[]` | no |
| sudo\_users | A list of sudo user configs | `list(tuple([string, string, string]))` | `[]` | no |
| swap\_maxsize | Maximum size (bytes) of swapfile (zero to disable swap) | `number` | `0` | no |
| timezone | Default timezone for EC2 instances | `string` | `"UTC"` | no |
| users | A list of regular user config | `list(tuple([string, string, string]))` | `[]` | no |
| write\_files | A list of files to configure via cloud-init (path, content) | `list(tuple([string, string]))` | `[]` | no |

## Outputs

No output.

