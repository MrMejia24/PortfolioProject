
resource "aws_instance" "ws_ec2" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.webtraffic.id]
    user_data = <<EOF
    #!/bin/bash
sudo yum update
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello from Terraform</h1>" | sudo tee /var/www/html/index.html

EOF

    tags = {
        "Name" = "WebServer"
    }    
}

resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    ingress {
        from_port =  80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = [ "0.0.0.0/0"]
    }
    ingress {
        from_port =  443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = [ "0.0.0.0/0"]
    }

    egress {
        from_port =  80
        to_port = 80
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

output "pub_ip" {
    value = module.eip.EIP 
}

module "eip" {
    source = "../../eip"
    }

