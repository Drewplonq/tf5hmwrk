###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "main"
  description = "VPC network&subnet name"
}

###common vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "your_ssh_ed25519_key"
  description = "ssh-keygen -t ed25519"
}

###example vm_web var
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "example vm_web_ prefix"
}

###example vm_db var
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "example vm_db_ prefix"
}



variable "vm_marketing" {
  type = object({
    env_name = string
    instance_name = string
    instance_count = number
    public_ip = bool
    owner = string
    project = string
  })
  default = {
    env_name = "marketing"
    instance_name = "marketing"
    instance_count = 1
    public_ip = true
    owner = "andrey_inozemtsev_aka_drew"
    project = "marketing"
  }
}
variable "vm_analytics" {
  type = object({
    env_name = string
    instance_name = string
    instance_count = number
    public_ip = bool
    owner = string
    project = string
  })
  default = {
    env_name = "analytics"
    instance_name = "analytics"
    instance_count = 1
    public_ip = true
    owner = "andrey_inozemtsev_aka_drew"
    project = "analytics"
  }
}
variable "vm_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "vm type boot disc"
}
variable "username" {
  type        = string
  default     = "ubuntu"
  description = "username for cloud-init"
}
variable "ssh_public_key" {
  type    = string
  default = "~/.ssh/id_ed25519.pub"
}

variable "ip_list" {
  type        = list(string)
  description = "список ip-адресов"

  validation {
    condition     = alltrue([for ip in var.ip_list : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}$", ip)) && cidrhost("${ip}/32", 0) != null])
    error_message = "Все адреса в списке должны быть корректными IP-адресами."
  }
  default = ["192.168.0.1", "1.1.1.1", "127.0.0.1"] 
}
