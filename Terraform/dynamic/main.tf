provider "aws" {
    region = "us-east-1"  
}

variable "ingress_rules" {
    type = list(number)
    default = [ 80,443 ]  
}

variable "egress_rules" {
    type = list(number)
    default = [ 80,443,25,3306,53,8080]  
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

    dynamic "ingress" {
        iterator = "port"
        for_each = var.ingressrules        
        from_port = port.value               
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = [ "0.0.0.0/0"]
        
    }

    egress {
        iterator = "port"
        for_each = var.egressrules
        from_port = port.value               
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = [ "0.0.0.0/0"]
        
    } 
    }
