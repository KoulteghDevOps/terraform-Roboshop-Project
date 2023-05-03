terraform {
    backend "s3" {
        bucket = "roboshopbk"
        key = "roboshopbk/dev/terraform.tfstate"
        region = "us-east-1"
    }
}