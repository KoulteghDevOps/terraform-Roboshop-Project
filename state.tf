terraform {
    backend "s3" {
        bucket = "roboshopbk"
        key = "roboshop/dev/terraform.tfstate"
        region = "us-east-1"
    }
}