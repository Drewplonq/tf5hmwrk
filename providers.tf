terraform {
backend "s3" {
    endpoints = {s3 = "https://storage.yandexcloud.net"}
    bucket = "net0l0gy"
    region = "ru-central1-a"
    key = "terraform.tfstate"
    skip_region_validation = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_s3_checksum = true
    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gmpma17e5otjoaje18/etnpmve3aocchc79qn7t"
    dynamodb_table = "tfstate-lock"
}
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}