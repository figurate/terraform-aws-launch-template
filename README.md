# ![AWS](aws-logo.png) Launch Template

Purpose: Blueprints for AWS Launch Templates.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| iam\_instance\_profile | Name of IAM instance profile associated with launched instances | `any` | `null` | no |
| image | Predefined filter for EC2 AMI | `string` | `"ecs-optimized"` | no |
| image\_owner | AMI image owner (leave blank for current account) | `string` | `"591542846629"` | no |
| instance\_type | EC2 instance type | `string` | `"t3.micro"` | no |
| name | Name to associate with the launch template | `any` | n/a | yes |
| security\_groups | List of security group names to attach | `list` | `[]` | no |
| template\_context | Additional contextual values relevant to the template user data | `map(string)` | `{}` | no |
| template\_type | A predefined template type used to configure user data, etc. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| launch\_template\_id | n/a |
| launch\_template\_name | n/a |

