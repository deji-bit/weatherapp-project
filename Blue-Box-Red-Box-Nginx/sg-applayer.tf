############################################################################
###   Security Group to be attached when provisioning the 2 App Nodes   ###
############################################################################

resource "aws_security_group" "app-nodes-sg" {
  name        = "app-server-sg"
  description = "App Nodes Sec Grps: created by Terraform"
  vpc_id = aws_vpc.thirdvpc.id

  tags = {
    Name = "sg-app-nodes"
  }

################################################
###               ALL INBOUND                ###
################################################
# proxy and ssh
# resource "aws_security_group_rule" "app_nodes_from_source_ingress_tcp" {
  ingress {
    from_port         = 80
    to_port           = 80
    protocol          = "tcp"
    cidr_blocks       = ["10.0.0.0/24"]
    description       = "web connection to proxy_server from all traffic"
  }

  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["10.0.0.0/24"]
    description       = "connection for ssh traffic"
  }

################################################
###               ALL OUTBOUND               ###
################################################

# resource "aws_security_group_rule" "app_nodes_to_other_machines_ssh" {
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow traffic to all destinations"
  }
}