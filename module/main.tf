resource "aws_instance" "instance" {
  ami                    = data.aws_ami.centos.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  iam_instance_profile   = aws_iam_instance_profile.instance_profile.name
  tags                   = var.app_type == "app" ? local.app_tags : local.db_tags
}
resource "null_resource" "provisioner" {
  depends_on = [aws_instance.instance, aws_route53_record.records]
  triggers = {
    private_ip = aws_instance.instance.private_ip
  }
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }

    inline = var.app_type == "db" ? local.db_commands : local.app_commands
  }
}
# resource "null_resource" "provisioner" {
#   # count      = var.provisioner ? 1 : 0
#   depends_on = [aws_instance.instance, aws_route53_record.records]
  
#   triggers = {
#     private_ip = aws_instance.instance.private_ip
#   }
#   provisioner "remote-exec" {

#     connection {
#       type     = "ssh"
#       user     = "centos"
#       password = "DevOps321"
#       host     = aws_instance.instance.private_ip
#     }

#     inline = var.app_type == "db" ? local.db_commands : local.app_commands 
#     # inline = [
#     #   "rm -rf roboshop-shell",
#     #   "git clone https://github.com/KoulteghDevOps/roboshop-shell",
#     #   "cd roboshop-shell",
#     #   "sudo bash ${var.component_name}.sh ${var.password}"
#     # ]
#   }
# }
resource "aws_route53_record" "records" {
  zone_id = "Z09569901LP0VHA42NP6C"
  name    = "${var.component_name}-dev.gilbraltar.co.uk"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip]
}

resource "aws_iam_role" "role" {
  name = "${var.component_name}-${var.env}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "${var.component_name}-${var.env}-role"
  }
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.component_name}-${var.env}-role"
  role = aws_iam_role.role.name
}

resource "aws_iam_role_policy" "ssm-ps-policy" {
  name = "${var.component_name}-${var.env}-ssm-ps-policy"
  role = aws_iam_role.role.id


  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "kms:Decrypt",
          "ssm:GetParameterHistory",
          "ssm:GetParametersByPath",
          "ssm:GetParameters",
          "ssm:GetParameter"
        ],
        "Resource" : [
          "arn:aws:kms:us-east-1:878756956432:key/c770d687-27ad-4188-b4b0-c3d4ce34a454",
          "arn:aws:ssm:us-east-1:878756956432:parameter/${var.env}.${var.component_name}.*"
        ]
      }
    ]
  })
}
