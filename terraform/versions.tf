# Токены лежат во внешнем файле, инициализацию проводить через команду: terraform init -backend-config=${TF_BACKEND_YC}
# Проверка: pre-commit run -a
terraform {
  required_providers {
    # Настройки провайдера яндекс облака
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.83.0"
    }
    # Настройки провайдера cloudflare
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }
  }
  backend "s3" {
    key                         = "state1/c1hw.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
  required_version = ">= 0.14.0"
}
# Настройки авторизации
provider "yandex" {
  service_account_key_file = file(var.yakey)
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}