resource "aws_security_group" "nginx-sg" {
  vpc_id = aws_vpc.my_vpc.id

# ingress means "inbound" traffic
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  # egress means "Outbound" traffic
  # "-1" indicates every protocol
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-sg"
  }
}