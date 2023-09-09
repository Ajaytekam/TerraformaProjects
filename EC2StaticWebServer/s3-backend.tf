terraform {
  backend "s3" {
    bucket = "ec2websrv-tfstate"
    // configure the bucket name 

    key = "terraform.tfstate"
    //configure the state file name 

    // Note: you can't use var.AWS_REGION variable here
    region = "ap-south-1"

    // terraform lock state 
    dynamodb_table = "terraform_locks"
    encrypt        = true
  }
}
