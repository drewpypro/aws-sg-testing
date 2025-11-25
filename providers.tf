terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
  backend "s3" {
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_s3_checksum            = true
    use_path_style              = true
    region                      = "wnam"
    access_key                  = var.BUCKET_ACCESS_KEY_ID
    secret_key                  = var.BUCKET_SECRET_ACCESS_KEY
    endpoints                   = { s3 = "https://${var.CLOUDFLARE_ACCOUNT_ID}.r2.cloudstorage.com"}
  }
}