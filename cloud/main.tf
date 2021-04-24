provider "aws" {
  region  = "us-east-1"
  profile = "ericrsilva"
}

module "vpc" {
  source       = "../modules/vpc/"
  env          = "prod"
  account_name = "cloud"
  key_name     = "cloud"
  key_file     = "/home/ericrsilva/.ssh/cloud.pem"
}
