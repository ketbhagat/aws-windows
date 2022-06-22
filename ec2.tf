#EC2 Instance
resource "aws_instance" "win" {
	ami = data.aws_ami.windows.id
	instance_type = "t2.micro"
	vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
	key_name = "Mumbai-KeyPair"
	tags = {
		Name = "WSC-Win"
	}
}
