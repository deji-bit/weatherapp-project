########################################################
###   Variables defined in the configuration files   ### 
##    use to create the Jenkins node.                ###
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
  type = string
  default = "t2.micro"
}

# Instance Tags
variable "instance_tag_jnks" {
  type    = string
  default = "weather-jenkins"
}

# Instance Tags
#variable "instance_tag_app" {
# type    = string
# default = "Blue-Box"
#}
