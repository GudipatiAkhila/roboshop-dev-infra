resource "aws_instance" "bastion" {
  ami = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.public_subnet_id
  vpc_security_group_ids = [local.bastion_sg_id]

  user_data = file("bastion.sh")
  associate_public_ip_address = true

    tags = merge (
  
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-bastion"
        }
    )



}


