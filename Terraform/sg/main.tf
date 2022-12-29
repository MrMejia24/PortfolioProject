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

resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    ingress {
        from_port =  443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = [ "0.0.0.0/0"]
    }

    egress {
        from_port =  443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = [ "0.0.0.0/0"] 
    }
}