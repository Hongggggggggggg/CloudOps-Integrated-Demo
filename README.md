## Architecture Overview

This project implements a comprehensive cloud operations architecture that consists of the following components:

- **VPC Infrastructure**: Secure network setup with public and private subnets across multiple availability zones
- **EC2 Instances**: Application servers deployed in private subnets with auto-scaling capabilities
- **NAT Instances**: Providing outbound internet access for private subnet resources
- **S3 Storage**: For storing application data, logs, and backups
- **RDS Database**: Managed database service for application data persistence
- **IAM Roles**: Properly configured access control for all components
- **Monitoring Stack**: Prometheus for metrics collection and Grafana for visualization

The architecture follows AWS best practices for high availability, security, and scalability, with infrastructure deployed as code using Terraform and configured using Ansible.

## Getting Started

### Prerequisites

- AWS Account
- [AWS CLI](https://aws.amazon.com/cli/)
- [Terraform](https://www.terraform.io/downloads.html) (v1.0.0 or later)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

### Setup AWS CLI

1. Install AWS CLI:

```bash
# macOS (using Homebrew)
brew install awscli

# Linux
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

2. Configure AWS credentials:

```bash
aws configure
```

Enter your AWS Access Key, Secret Key, default region (e.g., us-east-1), and output format (json recommended).

### Deploying Infrastructure with Terraform

1. Navigate to the terraform/envs/dev directory:

```bash
cd terraform/envs/dev
```

2. Initialize Terraform:

```bash
terraform init
```

3. Review the execution plan:

```bash
terraform plan
```

4. Apply the configuration:

```bash
terraform apply
```

5. After confirmation, Terraform will provision all resources defined in the architecture.

6. When you need to tear down the infrastructure, use the destroy command:

```bash
terraform destroy
```

After confirmation, Terraform will remove all resources that were created.

### Configuring Systems with Ansible


### Accessing Monitoring

