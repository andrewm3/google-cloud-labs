# variables.tf

variable name {
  description = "The name of the network to create."
}

variable subnetworks {
  description = "A map of subnetworks to create. If empty, will create the network in auto subnet mode."
  type        = "list"
  default     = []
}
