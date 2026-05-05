module "vpc" {
    source = "git::https://github.com/GudipatiAkhila/terraform-aws-vpc.git"

    #vpc
    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
    environment = var.environment
    vpc_tags = var.vpc_tags

    #Public subnet
    public_subnet_cidrs = var.public_subnet_cidrs

    #Private subnet
    private_subnet_cidrs = var.private_subnet_cidrs

    #database subnet
    database_subnet_cidrs = var.database_subnet_cidrs
    
    is_peering_required = true


}


