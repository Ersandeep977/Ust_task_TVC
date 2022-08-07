# #########################################################################################################
# # file for ELB Resource file
# # created by sandeep kumar Patel
# #########################################################################################################
# # AWS ELB
# resource "aws_lb" "test" {
#   name               = "test-lb-tf"
#   internal           = false
#   load_balancer_type = "application"
# #   security_groups    = [aws_security_group.lb_sg.id]
# #   subnets            = [for subnet in aws_subnet.public : subnet.id]
# subnets = ["subnet-025932dc8f1fae5a7", "subnet-013b57e9a6646797b"]

#   enable_deletion_protection = true

#   tags = {
#     Environment = "production"
#   }
# }

# #######################################################################################
# # LB target Group

# resource "aws_lb_target_group_attachment" "test" {
#   target_group_arn = aws_lb_target_group.Elb_tg.arn
#   target_id        = aws_instance.test.id
#   port             = 80
# }

# ###########################################################################################
# # ELB Listener 
# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = aws_lb.test.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.Elb_tg.arn
#   }
# }
# ###########################################################################################
# # ELB Target Group
# resource "aws_lb_target_group" "Elb_tg" {
#   name     = "tf-example-lb-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.Main_VPC.id
# }
