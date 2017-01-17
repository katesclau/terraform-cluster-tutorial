# Network & Region
variable "internal" { default = "false" }
variable "availability_zone" { }

# Name
variable "elb_name" {}

# Connection
variable "idle_timeout" { default = 1800 } # 30 mins
variable "connection_draining" { default = true } 
variable "connection_draining_timeout" { default = 400 } 

# SSL
variable "cert_file" {}
variable "key_file" {}

# Session Cookie
variable "session_cookie" {}

