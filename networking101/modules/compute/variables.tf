# variables.tf

variable name {
  description = "Name of the compute instance."
}

variable machine_type {
  description = "The machine type to create."
}

variable zone {
  description = "The zone the instance should be created in."
}

variable network {
  description = "The name of the network to attach the instance to."
}

variable subnetwork {
  description = "The name of the subnetwork to attach the instance to."
}

variable ip {
  description = "The private IP address to assign the instance."
  default     = ""
}
