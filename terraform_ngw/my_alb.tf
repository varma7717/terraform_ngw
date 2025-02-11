# resource "aws_lb" "kishore" {
#     name = "kishore-alb"
#     internal = false
#     load_balancer_type = "application"
#     security_groups = [aws_security_group.sg.id]
#     subnets=[aws_subnet.publicsubnets[0].id,aws_subnet.publicsubnets[1].id]
#     enable_deletion_protection = false
# }

# resource "aws_lb_target_group" "venkat" {
#     name = "venkat-target"
#     port = 80
#     protocol = "HTTP"
#     vpc_id = aws_vpc.jai.id
#     health_check {
#       path = "/index.html"
#       interval = 30
#       timeout = 5
#       healthy_threshold = 2
#       unhealthy_threshold = 2
#     }
# }

# resource "aws_lb_listener" "ajay" {
#     load_balancer_arn = aws_lb.kishore.arn
#     port = 80
#     protocol = "HTTP"
#     default_action {
#       type = "forward"
#       target_group_arn = aws_lb_target_group.venkat.arn
#     }
# }

# resource "aws_lb_target_group_attachment" "instance_attachment_1" {
#   target_group_arn   = aws_lb_target_group.venkat.arn
#   target_id          = aws_instance.jai[0].id
#   port               = 80
# }

# resource "aws_lb_target_group_attachment" "instance_attachment_2" {
#   target_group_arn   = aws_lb_target_group.venkat.arn
#   target_id          = aws_instance.jai_1[0].id
#   port               = 80
# }