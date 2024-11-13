# resource "aws_lb" "varma" {
#     name                       = "varma-nlb"
#     internal                   = false
#     load_balancer_type        = "network"
#     security_groups            = [aws_security_group.sg.id]
#     subnets                    = [aws_subnet.publicsubnets[0].id, aws_subnet.publicsubnets[1].id]
#     enable_deletion_protection = false
# }

# resource "aws_lb_target_group" "venki" {
#     name     = "venki-target"
#     port     = 8080
#     protocol = "TCP"
#     vpc_id   = aws_vpc.jai.id

#     health_check {
#         protocol              = "TCP"
#         interval              = 30
#         timeout               = 5
#         healthy_threshold     = 2
#         unhealthy_threshold   = 2
#     }
# }

# resource "aws_lb_listener" "sai" {
#     load_balancer_arn = aws_lb.varma.arn
#     port              = 80
#     protocol          = "TCP"

#     default_action {
#         type             = "forward"
#         target_group_arn = aws_lb_target_group.venki.arn
#     }
# }

# resource "aws_lb_target_group_attachment" "instance_attachment" {
#   target_group_arn   = aws_lb_target_group.venki.arn
#   target_id          = aws_instance.jai_1[0].id
#   port               = 80
# }