resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "1a98117c-18d9-423c-999f-e414fa6b37eb"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "4febf575-ceb7-485f-b48c-09e7128229bb"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "7b3fd425-212e-441e-842a-d2c3d4750581"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "72528da9-e7d1-433c-b448-a1582d0dc4c3"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "8a041159-eb00-4ba8-acda-892285cfb19a"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "1896e638-c74b-45f2-bca8-1639eef5129d"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "6266bd57-a0be-49e7-9e6d-90a0411fdf3b"
  }
}

resource "aws_lb_listener" "listener_good_1" {
  load_balancer_arn = aws_lb.lb_good_1.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "action"
  }
}

resource "aws_lb_listener" "listener_good_2" {
  load_balancer_arn = aws_lb.lb_good_2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_lb_listener" "listener_good_3" {
  load_balancer_arn = aws_lb.lb_good_3.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_alb_listener" "listener_good_1" {
  load_balancer_arn = aws_alb.alb_good_1.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
  tags = {
    yor_trace = "c599fa08-feb2-4dd3-9a28-a36bf73de668"
  }
}

resource "aws_lb_listener" "listener_bad_1" {
  load_balancer_arn = aws_lb.lb_bad_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_lb_listener" "listener_bad_2" {
  load_balancer_arn = aws_lb.lb_bad_2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_alb_listener" "listener_bad_1" {
  load_balancer_arn = aws_alb.alb_bad_1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
  tags = {
    yor_trace = "281fc668-10c0-4c9e-93a9-4db671e6c16f"
  }
}