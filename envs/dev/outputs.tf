output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "public_ec2_sg_id" {
  value = module.vpc.public_ec2_sg_id
}

output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = module.ec2.public_ip
}
