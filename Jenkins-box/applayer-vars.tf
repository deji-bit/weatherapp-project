#########################################################
### List of variables used in the configuration       ### 
### files for the 2 app nodes - Blue-box and Red-box  ###
#########################################################

# Number of nodes
variable "instance_count" {
  default = "2"
}


# Instance Tags
variable "instance_tag" {
  type    = list
  default = ["Blue-Box", "Red-Box"]
}
