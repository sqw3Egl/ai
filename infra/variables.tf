variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "uksouth"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "andyaifoundry"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  default     = "21cf3499-0582-4344-9a87-78253166a61a"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "AI Foundry Learning"
  }
}
