#########################################################
### List of variables used in the configuration files ### 
### for the 2 app nodes and the 1 Nginx Proxy Server  ###
#########################################################

# Number of nodes
variable "instance_count" {
  default = "3"
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
