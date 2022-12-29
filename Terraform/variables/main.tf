variable "vpcname" {
  type = string
  default = "myvpc"
}

variable "sshport" {
    type = number
    defaudefault = 22  
}

variable "enabled" {
    default = true  
}

variable "mylist" {
    type = list(string)
    default = [ "value1","value2" ]
}

variable "mymap" {
    type = mymap
    default = {
        Key1 = "Value1"
        Key2 = "Value2"
    }  
}

