output "public-ip-address" {
    value = aws_instance.example.public_ip
 
}

output "instnace_id" {
    value = aws_instance.example.id
}
