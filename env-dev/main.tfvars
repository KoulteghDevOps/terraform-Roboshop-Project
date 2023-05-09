app_servers = {
  frontend = {
    name = "frontend"
    instance_type = "t2.micro"
  }
  catalogue = {
    name = "catalogue"
    instance_type = "t2.micro"
  }
  user = {
    name = "user"
    instance_type = "t2.micro"
  }
  cart = {
    name = "cart"
    instance_type = "t2.micro"
  }
  payment = {
    name = "payment"
    instance_type = "t2.micro"
    password = "roboshop123"
  }
  shipping = {
    name = "shipping"
    instance_type = "t2. micro"
    password = "RoboShop@1"
  }
  # dispatch = {
  #   name = "dispatch"
  #   instance_type = "t2.micro"
  # }
}

env = "dev"

database_servers = {
  mongodb = {
    name = "mongodb"
    instance_type = "t2.micro"
  }
  redis = {
    name = "redis"
    instance_type = "t2.micro"
  }
  mysql = {
    name = "mysql"
    instance_type = "t2.micro"
    password = "RoboShop@1"
  }
  rabbitmq = {
    name = "rabbitmq"
    instance_type = "t2.micro"
    password= "roboshop123"
  }
}

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