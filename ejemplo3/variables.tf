variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "key" {
  description = "Value of key of access"
  type        = string
  default     = "id_aws"
}
