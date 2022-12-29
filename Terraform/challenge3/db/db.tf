resource "aws_instance" "db_ec2" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
    tags = {
        "Name" = "DB Server"
    }    
}

output "PrivateIp" {
    value = aws_instance.db_ec2.private_ip  
}
