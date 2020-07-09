#############################################################################################
### This config file will spin up 2 app nodes - one in Subnet-b (named Blue-Box), one in  ###
##  Subnet-c (named Red-Box) and 1 Nginx node in Subnet-d (named Prox Server) for high     ##
##  availability. All will be provisioned using an AMI provisioned by Packer.              ##
###             The nodes will be attched to the same Security Group.                     ###
############################################################################################# 

resource "aws_instance" "app-nodes" {
  ami                    = data.aws_ami.rpacker_image.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = element(local.subs, count.index + 1)
  vpc_security_group_ids = element(local.secgrp, count.index + 1)  
  count                  = var.instance_count
  user_data              = file(element(var.user_data, count.index + 1))
  
  tags = {
    Name = element(var.instance_tag, count.index + 1)
  }
}
data "aws_ami" "rpacker_image" {
  most_recent = true

   filter {
    name = "name"
    values = ["appnodes-packed-ami"]
    }
    filter {
     name = "virtualization-type"
     values = ["hvm"]
    }

    owners = ["133267663626"]  // ["issue the command aws sts get-caller-identity to get this info"]
 }
output "ip_address" {
  value = "${aws_instance.app-nodes.*.public_ip}"
}
