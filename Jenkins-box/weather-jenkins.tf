###################################################################################
###   Spin up the Jenkins instance inside Subnet-a using the AMI provisioned    ###
##    with Packer baked with Git, Terraform, Packer, Maven and Ansible and       ##
###   attach the Jenkins Security Group. Name this node "weather-jenkins".      ###                                  ### 
###################################################################################

# create an AWS EC2 instance to be used for Jenkins box using a Packer image
resource "aws_instance" "jenkins-node" {
  ami                    = data.aws_ami.packer_image.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              =  aws_subnet.thirdsubneta.id
  vpc_security_group_ids = ["${aws_security_group.jenkins-node-sg.id}"]
  
  tags = {
    Name = var.instance_tag_jnks
  }
}
# lookup the Packer image to be used for the Jenkins box
data "aws_ami" "packer_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["jenkinspacked-ami"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["self"] // [issue the command "aws sts get-caller-identity" to get this info]
}
output "Jenkins_ip_address" {
  value = aws_instance.jenkins-node.*.public_ip
}
