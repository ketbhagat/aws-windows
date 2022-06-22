#EC2 Instance
resource "aws_instance" "win" {
	ami = data.aws_ami.windows.id
	instance_type = "t2.micro"
#	user_data = <<EOF	
#	EOF
	key_name = "Mumbai-KeyPair"
	tags = {
		Name = "WSC-Win"
	}
}
