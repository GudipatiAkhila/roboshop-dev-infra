resource "aws_security_group_rule" "backend_alb_bastion" {
  type                     = "ingress"   # ✅ REQUIRED
   security_group_id        = local.backend_alb_sg_id   #frontend SG ID
   source_security_group_id = local.bastion_sg_id         # frontend Security Group iD 

   from_port = 80
   to_port   = 80
   protocol  = "tcp"        # ✅ correct field name
}

resource "aws_security_group_rule" "bastion-laptop" {
  type                     = "ingress"   # ✅ REQUIRED
  security_group_id        = local.bastion_sg_id  #frontend SG ID
  cidr_blocks =  ["0.0.0.0/0"]     # frontend Security Group iD 

   from_port = 22
   protocol  = "tcp"        # ✅ correct field name
   to_port   = 22
}

resource "aws_security_group_rule" "mongodb_bastion" {
  type                     = "ingress"   # ✅ REQUIRED
  security_group_id        = local.mongodb_sg_id  #frontend SG ID
  source_security_group_id = local.bastion_sg_id
   from_port = 22
   protocol  = "tcp"        # ✅ correct field name
   to_port   = 22
}

resource "aws_security_group_rule" "redis_bastion" {
  type                     = "ingress"   # ✅ REQUIRED
  security_group_id        = local.redis_sg_id  #frontend SG ID
  source_security_group_id = local.bastion_sg_id
   from_port = 22
   protocol  = "tcp"        # ✅ correct field name
   to_port   = 22
}