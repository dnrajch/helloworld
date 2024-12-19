provider "aws" {
    region = "ap-south-1"
}

module "ec2-instance" {
    source = "./module/ec2"
    ami_id = "ami-053b12d3152c0cc71"
    instance_type   = "t2.micro"
    name            = "first-app-ec2"
    subnet_id       = "subnet-03a9b308510282e55"
    key_name        = "first-app"
    security_groups = ["sg-04c8e089d6f2685d4"]
}

output "ec2_instance_id" {
    value = module.ec2-instance.instance_id
}

output "ec2_public_ip" {
    value = module.ec2-instance.public_ip
}

output "ec2_private_ip" {
    value = module.ec2-instance.private_ip
}