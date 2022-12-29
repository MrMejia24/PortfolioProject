provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "ec2" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
    tags = {
        "Name" = "EC2 Demo"
    }    
}