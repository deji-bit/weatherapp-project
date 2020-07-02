locals {
   subs = concat([aws_subnet.thirdsubnetb.id], [aws_subnet.thirdsubnetc.id], [aws_subnet.thirdsubnetd.id])
}

locals {
   secgrp = concat([aws_security_group.apps-nodes-sg.id])
}

