terraform {
  backend "s3" {
    bucket_name = "weatherappdemo-terraform"
    key         = "jenkins-terraform-tfstate"
    region      = "eu-west-2"
  }
}