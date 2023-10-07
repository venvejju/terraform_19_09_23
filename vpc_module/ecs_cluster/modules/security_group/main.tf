resource "aws_security_group" "ecs_ec2_sg" {
  name        = var.ecs_ec2_name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    
      description      = "TLS from VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      security_groups  = [aws_security_group.ecs_alb_sg.id]
        
  }

    ingress {
    
      description      = "TLS from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
        
  }
  

  egress {
    
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]

    
    }
  


}
resource "aws_security_group" "ecs_alb_sg" {
  name        = var.ecs_alb_name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    
      description      = "TLS from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
        
  }

  

  egress {
    
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]

    
    }
  


}
