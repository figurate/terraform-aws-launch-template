## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | Name of the ECS cluster the node belongs to | `any` | n/a | yes |
| iam\_instance\_profile | Name of IAM instance profile associated with launched instances | `any` | `null` | no |
| image\_name | Name filter for EC2 AMI | `string` | `"amzn2-ami-ecs-hvm-2.0.????????-x86_64-ebs"` | no |
| image\_owner | AMI image owner (leave blank for current account) | `string` | `"591542846629"` | no |
| instance\_type | EC2 instance type | `string` | `"t3.micro"` | no |
| template\_type | A predefined template type used to configure user data, etc. | `string` | `"ecs_optimized"` | no |

## Outputs

No output.

