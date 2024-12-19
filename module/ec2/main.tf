resource "aws_instance" "this" {
    ami = var.ami_id
    instance_type = var.instance_type

    tags = {
        Name = var.name
    }

    subnet_id = var.subnet_id
    key_name = var.key_name

    security_groups = var.security_groups
}
