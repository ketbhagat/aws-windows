#EC2 Instance
resource "aws_instance" "win" {
	ami = data.aws_ami.windows.id
	instance_type = "t2.micro"
	vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
	user_data = <<EOF
		<powershell>
		Set-Location "C:\Windows\system32"
		#Change TimeZone
		C:\Windows\System32\tzutil /s "Indian Standard Time"
		#Install Chrome 
		$Path = $env:TEMP;
		$Installer = "chrome_installer.exe";
		Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile     $Path\$Installer; 
		Start-Process -FilePath $Path\$Installer -ArgumentList "/silent /install" -Verb RunAs -Wait;
		Remove-Item $Path\$Installer
		#Set Chrome as default browser
		$chromePath = "${Env:ProgramFiles}\Google\Chrome\Application\" 
		$chromeApp = "chrome.exe"
		$chromeCommandArgs = "--make-default-browser"
		& "$chromePath$chromeApp" $chromeCommandArgs
		</powershell>
		EOF
	key_name = "Mumbai-KeyPair"
	tags = {
		Name = "WSC-Win"
	}
}
