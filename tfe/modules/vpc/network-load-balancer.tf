###Create Load balancer
resource "aws_lb" "tfe-lb" {
  name                       = "tfe-lb"
  internal                   = false
  load_balancer_type         = "network"
  enable_deletion_protection = false
  subnet_mapping {
    subnet_id     = aws_subnet.tfe-vpc-tfe-subnet.id
    allocation_id = aws_eip.tfe-eip.id
  }
  tags = {
    Environment = "tfe load balancer"
  }
  depends_on = [aws_internet_gateway.tfe-vpc-internet-gw]
}

########Allowing traffic rules
###Allowing HTTP traffic 
resource "aws_lb_target_group" "http" {
  name     = "tf-example-lb-http"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.tfe-vpc.id
  stickiness {
    enabled = false
    type    = "lb_cookie"
  }
}

resource "aws_lb_target_group_attachment" "http" {
  target_group_arn = aws_lb_target_group.http.arn
  target_id        = aws_instance.tfe.id
  port             = 80
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.tfe-lb.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
}

###Allowing HTTPS traffic 
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.tfe-lb.arn
  port              = "443"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https.arn
  }
}

resource "aws_lb_target_group_attachment" "https" {
  target_group_arn = aws_lb_target_group.https.arn
  target_id        = aws_instance.tfe.id
  port             = 443
}

resource "aws_lb_target_group" "https" {
  name     = "tf-example-lb-tg-https"
  port     = 443
  protocol = "TCP"
  vpc_id   = aws_vpc.tfe-vpc.id
  stickiness {
    enabled = false
    type    = "lb_cookie"
  }
}

######Allowing SSH traffic 
resource "aws_lb_listener" "ssh" {
  load_balancer_arn = aws_lb.tfe-lb.arn
  port              = "22"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ssh.arn
  }
}

resource "aws_lb_target_group_attachment" "ssh" {
  target_group_arn = aws_lb_target_group.ssh.arn
  target_id        = aws_instance.tfe.id
  port             = 22
}

resource "aws_lb_target_group" "ssh" {
  name     = "tf-example-lb-tg-ssh"
  port     = 22
  protocol = "TCP"
  vpc_id   = aws_vpc.tfe-vpc.id
  stickiness {
    enabled = false
    type    = "lb_cookie"
  }
}

###Allowing PTFE 8800 traffic
resource "aws_lb_listener" "ptf" {
  load_balancer_arn = aws_lb.tfe-lb.arn
  port              = "8800"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ptf.arn
  }
}

resource "aws_lb_target_group_attachment" "ptf" {
  target_group_arn = aws_lb_target_group.ptf.arn
  target_id        = aws_instance.tfe.id
  port             = 8800
}

resource "aws_lb_target_group" "ptf" {
  name     = "tf-example-lb-tg-ptf"
  port     = 8800
  protocol = "TCP"
  vpc_id   = aws_vpc.tfe-vpc.id
  stickiness {
    enabled = false
    type    = "lb_cookie"
  }
}
