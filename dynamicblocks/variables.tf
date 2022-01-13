variable "profile" {}
variable "region" {}

variable "proxy_inbound" {
    default = [{
    description = "Example",
    port = 3128,
    protocol = "tcp"   
    cidr_blocks = ["195.153.82.150/32", "195.133.80.1/32", "89.167.69.10/32", "89.127.69.11/32"]
  }, 
  {
    description = "SSH inbound",
    port = 22,
    protocol = "tcp"    
    SSH = ["192.168.24.0/22", "192.168.152.0/21", "192.168.128.0/21", "172.28.128.0/19", "192.168.130.0/24"]
  }]
  
}

variable "proxy_outbound" {
    default = [{
    description = "HTTPS Outbound to internet",
    port = 443,
    protocol = "tcp"    
    cidr_blocks = ["0.0.0.0/0"]
  }, 
  {
    description = "HTTP Outbound to internet",
    port = 80,
    protocol = "tcp"    
    cidr_blocks = ["0.0.0.0/0"]
  }]
  
}

