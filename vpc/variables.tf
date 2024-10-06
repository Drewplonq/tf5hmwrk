variable "env_name" {
  type = string
  default = "vpcnet"
}

variable "zone" {
  type = string
  default = "ru-central1-a"
}
variable "v4_cidr_block" {
  type        = list(string)
  default     = ["10.0.3.0/24"]
}