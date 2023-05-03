terraform {
    backend "s3" {
        bucket = "roboshop-bk"
        key = "roboshop/dev/terraform.tfstate"
        region = "us-east-1"
    }
}