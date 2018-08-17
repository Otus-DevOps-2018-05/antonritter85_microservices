variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable machine_type {
  description = "Type of virtual manchine in GCE"
  default     = "n1-standard-1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_size {
  description = "Instance disk size "
  default     = "10"
}

variable disk_image {
  description = "Disk image"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable number_of_instances {
  description = "Number of compute instances"
  default     = "1"
}
