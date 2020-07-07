########################################################
###   Variables defined in the configuration files   ### 
###   used to create the Jenkins node.               ###
######################################################## 

#  AWS Region 
variable "region" {
  default = "eu-west-2"
}

#  Private Key 
variable "key_name" {
  default = "first_keys"
}

# Instance Type
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# Number of nodes
variable "instance_count_jnks" {
  default = "1"
}

# Instance Tags
variable "instance_tag_jnks" {
  type    = string
  default = "weather-jenkins"
}


