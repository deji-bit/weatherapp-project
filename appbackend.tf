terraform {
  backend "s3" {
    bucket = "weatherappdemo-terraform"
    key    = "app-terraform-tfstate"
    region = "eu-west-2"
  }
}