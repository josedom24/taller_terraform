output "instance_ip_addr" {  
    value = aws_instance.app_server.public_ip
}

output "instance_url" {  
    value = aws_instance.app_server.public_dns
}