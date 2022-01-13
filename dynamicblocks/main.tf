resource "aws_security_group" "proxy-sg-01" {
  name        = "${var.profile}-proxy-sg-01"
  description = "Security group for proxy"
  vpc_id      = "${data.terraform_remote_state.vpc.outputs.vpc_id}" # not shown in example

  dynamic "ingress" {
    for_each = var.proxy_inbound
    content {
      description = "${ingress.value.description}"
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks

    }
  }

  dynamic "egress" {
    for_each = var.proxy_outbound
    content {
      description = "Allow ${egress.value.description} out"
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "${var.profile}-proxy-sg-01"
  }
}