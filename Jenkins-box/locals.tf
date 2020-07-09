locals {
   subs = concat([aws_subnet.thirdsubnetb.id], [aws_subnet.thirdsubnetc.id], [aws_subnet.thirdsubnetd.id])
}

locals {
   secgrp = concat([aws_security_group.app-nodes-sg.id], [aws_security_group.app-nodes-sg.id], [aws_security_group.proxy-node-sg.id])
}

