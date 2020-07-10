locals {
   subs = concat([aws_subnet.thirdsubnetb.id], [aws_subnet.thirdsubnetc.id])
}

