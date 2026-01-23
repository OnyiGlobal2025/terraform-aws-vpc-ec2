module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones

  allowed_ssh_cidr = var.allowed_ssh_cidr

}


module "ec2" {
  source = "../../ec2"

  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name

  subnet_id          = module.vpc.public_subnet_id
  security_group_id  = module.vpc.public_ec2_sg_id
}
