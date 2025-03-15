provider "aws" {
  region = "ap-northeast-2" # 서울 리전
}

# Launch Template (EC2 인스턴스 템플릿)
resource "aws_launch_template" "example" {
  name = "example-launch-template"
  
  instance_type = "t2.micro"  # 인스턴스 타입
  ami           = "ami-0abcd1234efgh5678"  # 사용 가능한 AMI ID (리전에 따라 다름)

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = "subnet-12345678"  # 서브넷 ID
  }
}

# Auto-scaling Group
resource "aws_autoscaling_group" "example" {
  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }

  vpc_zone_identifier = ["subnet-12345678"] # 사용할 서브넷 ID
  desired_capacity    = 2  # 초기 EC2 인스턴스 수
  max_size            = 5  # 최대 인스턴스 수
  min_size            = 1  # 최소 인스턴스 수

  tag {
    key                 = "Name"
    value               = "example-instance"
    propagate_at_launch = true
  }
}

# Scaling Policy
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.example.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.example.name
}
