# ![AWS](aws-logo.png) Launch Template

![AWS Launch Template](aws\_launch\_template.png)

Purpose: Blueprints for AWS Launch Templates.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| associate\_public\_ip\_address | Allocation a public IP address (required for Internet access) | `bool` | `true` | no |
| iam\_instance\_profile | Name of IAM instance profile associated with launched instances | `any` | `null` | no |
| image\_id | AMI image identifier | `any` | n/a | yes |
| instance\_type | EC2 instance type | `string` | `"t3.micro"` | no |
| metadata\_v2 | Enforce metadata version 2 | `bool` | `true` | no |
| name | Name to associate with the launch template | `any` | n/a | yes |
| security\_groups | List of security group names to attach | `list` | `[]` | no |
| user\_data | Encoded user data | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| launch\_template\_id | n/a |
| launch\_template\_name | n/a |

