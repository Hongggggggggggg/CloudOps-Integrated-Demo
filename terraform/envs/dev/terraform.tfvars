vpc_cidr = "10.0.0.0/16"
vpc_name = "demo-vpc"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
public_azs  = ["ap-northeast-1a", "ap-northeast-1c"]
private_azs = ["ap-northeast-1a", "ap-northeast-1c"]

demo_key_pair = "demo-key-pair"
ami_id = "ami-084614baa32efe9f2"  # Amazon Linux 2 AMI (HVM) in ap-northeast-1
instance_type = "t2.micro"

user_data_web = <<EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello from EC2 instance!</h1>" > /var/www/html/index.html
    amazon-linux-extras install -y python3.8
    alternatives --set python3 /usr/bin/python3.8
    python3.8 -m pip install --upgrade pip
    python3.8 -m pip install pywinrm
    EOF

user_data_app = <<EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello from Application EC2 instance!</h1>" > /var/www/html/index.html
    EOF

iam_instance_profile_name = "demo-ec2-instance-profile"
