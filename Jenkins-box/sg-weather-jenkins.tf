###############################################################################
### Create the Security Group to be used when provisioning the Jenkins Node ###
###############################################################################

resource "aws_security_group" "jenkins-node-sg" {
  name        = "jenkins-server-sg"
  description = "Jenkins Server Sec Grps: created by Terraform"
  vpc_id = aws_vpc.thirdvpc.id

  tags = {
    Name = "sg-jenkins-server"
    
  }

################################################
###               ALL INBOUND                ###
################################################
# ssh
  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]  // allow ssh connection to Jenkins from all source 
    description       = "ssh to jenkins_server"
  }

# webui
  ingress {
    from_port         = 8080
    to_port           = 8080
    protocol          = "tcp"
    cidr_blocks       = ["31.50.210.201/32"]   // Port 8080 locked down to My local network
    description       = "connection for jenkins server WebUI from my IP ONLY"
  }

################################################
###               ALL OUTBOUND               ###
################################################
  egress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    description       = "allow jenkins box to ssh to other machines"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow traffic to all destinations"
  }
}