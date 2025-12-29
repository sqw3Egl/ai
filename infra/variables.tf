variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "aifoundry"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {
    Environment = "dev"
    Project     = "AI Foundry Learning"
  }
}