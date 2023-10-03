
output "subnet_id" {
   description = "Value for subnet_id"
   value = aws_subnet.public[*].id

}


