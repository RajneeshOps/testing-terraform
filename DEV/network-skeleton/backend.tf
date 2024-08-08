terraform {
  backend "s3" {
    bucket = "op-micro-services-p9"
    key    = "network/terraform.tfstate"
    region = "ap-south-1"
  }
}
