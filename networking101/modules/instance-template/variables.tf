# variables.tf

variable name {
  description = "The name of the instance template."
}

variable region {
  description = "The region to create the instance template in."
}

variable network {
  description = "The network to create the instance template in."
  default     = ""
}

variable subnetwork {
  description = "The network to create the instance template in."
  default     = ""
}
