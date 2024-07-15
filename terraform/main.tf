module "s3"{
  source    =   "./modules/s3"
  bucket_name = var.bucket_name
}

module "ec-2"{
  source    =   "./modules/ec-2"
  region    =   "eu-west-1"
}

module "cicd"{
  source    =   "./modules/cicd"
  bucket_name = var.bucket_name
}