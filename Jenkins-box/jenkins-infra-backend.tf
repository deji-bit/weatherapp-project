terraform {
  backend "s3" {
    bucket = "weatherappdemo-terraform"
    key         = "jenkins-terraform-tfstate"
    region      = "eu-west-2"
  }
}