terraform {
  backend "s3" {
    bucket = "weatherappdemo-terraform"
    key    = "app-layer-tfstate"
    region = "eu-west-2"
  }
}