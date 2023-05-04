components = {
    frontend = {
      name = "frontend"
      instance_type = "t3.small"
    }
    mongodb = {
      name = "mongodb"
      instance_type = "t3.small"
    }
    catalogue = {
      name = "catalogue"
      instance_type = "t3.small"
    }
    redis = {
      name = "redis"
      instance_type = "t3.small"
    }
    user = {
      name = "user"
      instance_type = "t3.micro"
    }
    cart = {
      name = "cart"
      instance_type = "t3.micro"
    }
    mysql = {
      name = "mysql"
      instance_type = "t3.small"
      password = "RoboShop@1"
    }
    rabbitmq = {
      name = "rabbitmq"
      instance_type = "t3.small"
      password= "roboshop123"
    }
    payment = {
      name = "payment"
      instance_type = "t3.small"
      password = "roboshop123"
    }
    shipping = {
      name = "shipping"
      instance_type = "t3.medium"
    }
    # dispatch = {
    #   name = "dispatch"
    #   instance_type = "t2.micro"
    # }
}

env = "prod"

# components = {
#     frontend = {
#       name = "frontend"
#       instance_type = "t2.micro"
#     }
#     mongodb = {
#       name = "mongodb"
#       instance_type = "t2.micro"
#     }
#     catalogue = {
#       name = "catalogue"
#       instance_type = "t2.micro"
#     }
#     redis = {
#       name = "redis"
#       instance_type = "t2.micro"
#     }
#     user = {
#       name = "user"
#       instance_type = "t2.micro"
#     }
#     cart = {
#       name = "cart"
#       instance_type = "t2.micro"
#     }
#     mysql = {
#       name = "mysql"
#       instance_type = "t2.micro"
#       password = "RoboShop@1"
#     }
#     rabbitmq = {
#       name = "rabbitmq"
#       instance_type = "t2.micro"
#       password = "roboshop123"
#     }
#     payment = {
#       name = "payment"
#       instance_type = "t2.micro"
#       password = "roboshop123"
#     }
#     shipping = {
#       name = "shipping"
#       instance_type = "t2.micro"
#     }
#     # dispatch = {
#     #   name = "dispatch"
#     #   instance_type = "t2.micro"
#     # }
# }

# env = "dev"