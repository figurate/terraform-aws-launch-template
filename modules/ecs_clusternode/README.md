## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | Name of the ECS cluster the node belongs to | `any` | n/a | yes |
| iam\_instance\_profile | Name of IAM instance profile associated with launched instances | `string` | `"ecs-clusternode-instanceprofile"` | no |
| image | Predefined filter for EC2 AMI | `string` | `"ecs-optimized"` | no |
| image\_owner | AMI image owner (leave blank for current account) | `string` | `"591542846629"` | no |
| instance\_type | EC2 instance type | `string` | `"t3.micro"` | no |
| name | Name to associate with the launch template | `any` | n/a | yes |
| security\_groups | List of security group names to attach | `list` | `[]` | no |
| template\_type | A predefined template type used to configure user data, etc. | `string` | `"ecs_optimized"` | no |

## Outputs

| Name | Description |
|------|-------------|
| launch\_template\_id | n/a |
| launch\_template\_name | n/a |

