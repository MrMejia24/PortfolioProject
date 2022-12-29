provider "aws" {
    region = "us-east-1"  
}

module "db" {
    source = "./db"  
}

module "web" {
    source = "./web"  
}

output "PrivateIp" {
    value = module.db.PrivateIp  
}

output "PublicIp" {
    value = module.web.pub_ip  
}


