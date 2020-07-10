###################################################################################
###   Spin up the Nginx web server inside Subnet-d using the AMI provisioned    ###
##    with Packer baked with Nginx 1.12 and attach the Proxy Server Security     ##
###   Group. Name this node "proxy server".                                     ###
###################################################################################

resource "aws_instance" "proxy-node" {
  ami                    = data.aws_ami.npacker_image.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              =  aws_subnet.thirdsubnetd.id
  vpc_security_group_ids = ["${aws_security_group.proxy-node-sg.id}"]
  count                  = var.instance_count_ngx
  
  tags = {
    Name = var.instance_tag_ngx
  }
}
# lookup the Packer image to be used for the Proxy node
data "aws_ami" "npacker_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["nginxpacked-ami"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["self"] // [issue the command "aws sts get-caller-identity" to get this info]
}
output "proxynode_ip_address" {
  value = aws_instance.proxy-node.*.public_ip
}
