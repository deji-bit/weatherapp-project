#########################################################
### List of variables used in the configuration files ### 
### for the 2 app nodes and the 1 Nginx Proxy Server  ###
#########################################################

# Number of nodes
variable "instance_count" {
  default = "3"
}

# Security Groups
variable "security_groups" {
  type    = list
  default = ["aws_security_group.app-nodes-sg.id", "aws_security_group.app-nodes-sg.id", "aws_security_group.proxy-node-sg.id"]
}

# User Data
variable "user_data" {
  type    = list
  default = ["blue-box.tpl", "red-box.tpl", "installnginx.tpl"]
}

# Instance Tags
variable "instance_tag" {
  type    = list
  default = ["Blue-Box", "Red-Box", "Proxy Server"]
}
