# variables.tf

variable project {
  description = "The ID of the project to create the resources in."
}

variable network {
  description = "The name of the network to create the instances in."
  default     = "networking101"
}
