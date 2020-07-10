#####################################################
###  List of variables used in the configuration  ### 
###  files for the nginx proxy server             ###
#####################################################

# Number of nodes
variable "instance_count_ngx" {
  default = "1"
}


# Instance Tags
variable "instance_tag_ngx" {
  type    = string
  default = "Proxy Server"
}
