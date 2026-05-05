#open source module 
/*module "catalogue" {
    source = "terraform-aws-modules/security-group/aws"

    name = "${local.common_name_suffix}-catalogue"
    description = "security group for catalogue with custom parts open within VPC, egress all traffic"
    vpc_id = "vpc-12345678"

  
} */

module "sg" {
    count = length(var.sg_names)
    source = "git::https://github.com/GudipatiAkhila/terraform-aws-sg.git?ref=main"
    project_name =var.project_name
    environment = var.environment
    sg_name = var.sg_names[count.index]
    sg_description = "Created for ${var.sg_names[count.index]}"
    vpc_id = local.vpc_id 
}

# #frontend accepting traffic from frontend ALB
# resource "aws_security_group_rule" "frontend_frontend_alb" {
#   type                     = "ingress"   # ✅ REQUIRED
#   security_group_id        = module.sg[9].sg_id   #frontend SG ID
#   source_security_group_id = module.sg[11].sg_id  # frontend Security Group iD 

#   from_port = 80
#   to_port   = 80
#   protocol  = "tcp"        # ✅ correct field name
# }



