terraform {
  backend "s3" {
    bucket = "rajneesh-bucket"
    key    = "network/terraform.tfstate"
    region = "ap-south-1"
  }
}
