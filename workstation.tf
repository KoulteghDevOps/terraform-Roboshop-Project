# data "aws_ami" "centos" {
#   owners = ["973714476881"]
#   most_recent      = true
#   name_regex       = "Centos-8-DevOps-Practice"
# }

# data "aws_security_group" "allow-all" {
#   name = "allow-all"
# }
# variable "instance_type" {
#   default = "t2.micro"
# }
resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = each.value["name"]
  }
}

resource "null_resource" "provisioner" {

  depends_on   = [aws_instance.instance, aws_route53_record.records]
  for_each     = var.components
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance[each.value["name"]].private_ip
    }

    inline = [
      "rm -rf roboshop-shell",
      "git clone https://github.com/KoulteghDevOps/roboshop-shell",
      "cd roboshop-shell",
      "sudo bash ${each.value["name"]}.sh"
    ]
  }
}
resource "aws_route53_record" "records" {
  for_each = var.components
  zone_id = "Z09569901LP0VHA42NP6C"
  name    = "${each.value["name"]}-dev.gilbraltar.co.uk"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}

# variable "components" {
#   default = [ "frontend", "mongodb", "catalogue" ]
# }
#   resource "aws_instance" "instance" {
#   count         = length(var.components)
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = var.components[count.index]
#   }
# }

# resource "aws_instance" "frontend" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = "frontend"
#   }
# }

# resource "aws_route53_record" "frontend" {
#   zone_id = "Z09569901LP0VHA42NP6C"
#   name    = "frontend-dev.gilbraltar.co.uk"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.frontend.private_ip]
# }

# output "frontend" {
#     value = aws_instance.frontend.public_ip
# }

# resource "aws_instance" "mongodb" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = "mongodb"
#   }
# }

# resource "aws_route53_record" "mongodb" {
#   zone_id = "Z09569901LP0VHA42NP6C"
#   name    = "mongodb-dev.gilbraltar.co.uk"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.mongodb.private_ip]
# }
# resource "aws_instance" "catalogue" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = "catalogue"
#   }
# }

# resource "aws_route53_record" "catalogue" {
#   zone_id = "Z09569901LP0VHA42NP6C"
#   name    = "catalogue-dev.gilbraltar.co.uk"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.catalogue.private_ip]
# }

# resource "aws_instance" "redis" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = "redis"
#   }
# }

# resource "aws_route53_record" "redis" {
#   zone_id = "Z09569901LP0VHA42NP6C"
#   name    = "redis-dev.gilbraltar.co.uk"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.redis.private_ip]
# }

# resource "aws_instance" "user" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = "user"
#   }
# }

# resource "aws_route53_record" "user" {
#   zone_id = "Z09569901LP0VHA42NP6C"
#   name    = "user-dev.gilbraltar.co.uk"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.user.private_ip]
# }

# resource "aws_instance" "cart" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = "cart"
#   }
# }

# resource "aws_route53_record" "cart" {
#   zone_id = "Z09569901LP0VHA42NP6C"
#   name    = "cart-dev.gilbraltar.co.uk"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.cart.private_ip]
# }

# resource "aws_instance" "mysql" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = "mysql"
#   }
# }

# resource "aws_route53_record" "mysql" {
#   zone_id = "Z09569901LP0VHA42NP6C"
#   name    = "mysql-dev.gilbraltar.co.uk"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.mysql.private_ip]
# }

# resource "aws_instance" "rabbitmq" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = "rabbitmq"
#   }
# }

# resource "aws_route53_record" "rabbitmq" {
#   zone_id = "Z09569901LP0VHA42NP6C"
#   name    = "rabbitmq-dev.gilbraltar.co.uk"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.rabbitmq.private_ip]
# }

# resource "aws_instance" "payment" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = "payment"
#   }
# }

# resource "aws_route53_record" "payment" {
#   zone_id = "Z09569901LP0VHA42NP6C"
#   name    = "payment-dev.gilbraltar.co.uk"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.payment.private_ip]
# }

# resource "aws_instance" "dispatch" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = "dispatch"
#   }
# }

# resource "aws_route53_record" "dispatch" {
#   zone_id = "Z09569901LP0VHA42NP6C"
#   name    = "dispatch-dev.gilbraltar.co.uk"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.dispatch.private_ip]
# }

# resource "aws_instance" "shipping" {
#   ami           = data.aws_ami.centos.image_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

#   tags = {
#     Name = "shipping"
#   }
# }

# resource "aws_route53_record" "shipping" {
#   zone_id = "Z09569901LP0VHA42NP6C"
#   name    = "shipping-dev.gilbraltar.co.uk"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.shipping.private_ip]
# }