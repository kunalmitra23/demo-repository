provider "aws" {
  region     = "us-east-2"
  access_key = "AKIA5GDKMBURLRWMDGWI"
  secret_key = "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"
}

variable "egress_ports" {
  type = list(number)
  default = [8201,8301,8500,9200]
}

resource "aws_security_group" "leo_sg" {
  name = "leo_sg"

  dynamic "egress" {
    for_each = var.egress_ports
    content {
      from_port = egress.value
      to_port = egress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
