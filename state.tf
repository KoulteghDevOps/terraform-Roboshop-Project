terraform {
    backend "s3" {
        bucket = "roboshop-project"
        key = "roboshop/dev/terraform.tfstate"
        region = "us-east-1"
    }
}