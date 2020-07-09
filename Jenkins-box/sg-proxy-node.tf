###########################################################################
###   Security Group to be attached to our 2 App Nodes and Nginx Node   ###
###########################################################################

resource "aws_security_group" "proxy-node-sg" {
  name        = "proxy-server-sg"
  description = "Proxy Node Sec Grps: created by Terraform"
  vpc_id = aws_vpc.thirdvpc.id

  tags = {
    Name = "sg-proxy-nodes"
  }

################################################
###               ALL INBOUND                ###
################################################
# proxy and ssh
# resource "aws_security_group_rule" "proxy_node_from_source_ingress_tcp" {
  ingress {
    from_port         = 80
    to_port           = 80
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    description       = "web connection to proxy_server from all traffic"
  }

  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    description       = "connection for ssh traffic"
  }

################################################
###               ALL OUTBOUND               ###
################################################

# resource "aws_security_group_rule" "proxy_node_to_other_machines" {
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow traffic to all destinations"
  }
}