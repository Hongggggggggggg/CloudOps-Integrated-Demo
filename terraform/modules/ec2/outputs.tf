output "launch_template_id" {
    value = aws_launch_template.ec2_template.id 
}

output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value       = aws_instance.this.public_ip
}