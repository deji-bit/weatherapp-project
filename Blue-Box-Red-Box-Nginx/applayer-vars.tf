#########################################################
### List of variables used in the configuration files ### 
### for the 2 app nodes and the Nginx Proxy Server    ###
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
  default = ["", "", "installnginx.tpl"]
}

# Instance Tags
variable "instance_tag" {
  type    = list
  default = ["Blue-Box", "Red-Box", "Proxy Server"]
}
