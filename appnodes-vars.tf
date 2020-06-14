#########################################################
### List of variables used in the configuration files ### 
### for the 2 app nodes and 1 Nginx Proxy Server      ###
#########################################################

#  AWS Private Key Credential 
variable "key_name" {
  default = "first_keys"
}

#  AWS Region
variable "region" {
  default = "eu-west-2"
}

# Instance Type
variable "instance_type" {
   type = string
  default = "t2.micro"
}

# Number of nodes
variable "instance_count" {
  default = "3"
}

# User Data
variable "user_data" {
  type    = list
  default = ["installmaventomcat.tpl", "installmaventomcat.tpl", "installnginx.tpl"]
}

# Instance Tags
variable "instance_tag" {
  type    = list
  default = ["Blue-Box", "Red-Box", "Proxy Server"]
}

#  VPC-Subnet for app nodes ONLY
#variable "subnet_id" {
#   type = list
#  default = ["aws_subnet.thirdsubnetb.id", "aws_subnet.thirdsubnetc.id"]     
#}

# Security Groups for app nodes and nginx node ONLY
#variable "vpc_security_group_ids" {
#    type = string
#  default = "aws_security_group.apps-nodes-sg.id"
#}
