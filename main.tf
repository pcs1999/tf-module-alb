
resource "aws_security_group" "alb" {
  name        = "${var.env}-alb_${var.subnets_name}-security_group"
  description = "${var.env}-alb_${var.subnets_name}_subnet_group"
  vpc_id      = var.vpc_id


  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.allow_cidr

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge (local.common_tags, { Name = "${var.env}-alb_${var.subnets_name}_subnet_group" } )

}



