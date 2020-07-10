################################################################################################
### This config file will spin up 2 app nodes - one in Subnet-b (named Blue-Box) and one in  ###
##  Subnet-c (named Red-Box) for high availability. Both will be provisioned using an AMI     ##
### baked with Java 8 by Packer. The nodes will be attched to the same Security Group.       ###
################################################################################################ 

resource "aws_instance" "app-nodes" {
  ami                    = data.aws_ami.rpacker_image.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = element(local.subs, count.index + 1)
  vpc_security_group_ids = ["${aws_security_group.app-nodes-sg.id}"]  
  count                  = var.instance_count
  
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
