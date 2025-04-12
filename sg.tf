resource "aws_security_group" "all_worker_mgmt" {
  name   = "all_worke_managment"
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "sg-eks"
  }
}

resource "aws_security_group_rule" "all_worker_mgmt_ingress" {

  type              = "ingress"
  description       = "allow inbound traffic from eks"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  security_group_id = aws_security_group.all_worker_mgmt.id
  cidr_blocks       = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16", ]


}

resource "aws_security_group_rule" "all_worker_mgmt_egress" {

  type              = "egress"
  description       = "allow outbound traffic to anywhere"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  security_group_id = aws_security_group.all_worker_mgmt.id
  cidr_blocks       = ["0.0.0.0/0"]


}
