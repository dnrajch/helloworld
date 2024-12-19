variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type        = string
}

variable "instance_type" {
    description = "instance Type of the EC2 instance"
    type        = string
}

variable "name" {
    description = "Name of the EC2 instance"
    type        = string
}

variable "subnet_id" {
    description = "Subnet ID where the EC2 instance will be launched"
    type        = string
}

variable "key_name" {
    description = "Key pair name for SSH access"
    type        = string
    default     = null
}

variable "security_groups" {
    description = "Security groups to associate with the instance"
    type        = list(string)
    default     = []
}