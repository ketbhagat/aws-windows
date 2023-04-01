#Outputs
output "PublicIP" {
	value = aws_instance.win.public_ip
}
