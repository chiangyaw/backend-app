resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "08fce06e-563f-4e9f-ae9e-9b7e6509bebd"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "9db5b42f-8103-4796-b72f-074b9f3e6bd2"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "f548de4c-42d5-4a3c-8e16-0ac828c7739b"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "ba24cf5e-e803-43e6-9514-77894985c061"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "7e177c70-b49b-485c-8fbf-5f2b43902ebc"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "8f5fa7f1-43f9-42f3-a69e-30610118d97f"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "cdcb03f0-4a9b-4530-ab51-efdb226b1ceb"
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
    yor_trace = "4286ba0a-6a03-4e4c-acdd-ca8513309e26"
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
    yor_trace = "a05a7a28-9352-4e66-9cfe-89a126c0f9e3"
  }
}