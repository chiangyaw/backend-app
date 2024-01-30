resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "b664b913-9157-4f71-8f76-6338b9b01775"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "94f65b87-be33-464e-883a-4d57be15a466"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "3b7af014-f46e-49a4-a0e9-26db021fddd6"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "ba2b75f3-821e-4a7c-b409-60b6bd99d156"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "5f7eebd8-9bd2-4b17-b58e-b0226149d27f"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "c2d582b1-4fe6-4af6-bac6-da7201d5d132"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "57d2a1aa-de49-4532-b969-99e85efd6cb1"
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
    yor_trace = "a75d99d1-0f69-42c2-a52c-68d6b0b01770"
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
    yor_trace = "48133073-6488-4c13-865b-fa9708c5c80d"
  }
}