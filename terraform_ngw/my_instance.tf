resource "aws_instance" "jai" {
    count =1
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids =[aws_security_group.sg.id]
    subnet_id = aws_subnet.privatesubnets[0].id
    private_ip = var.private_ip
    user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    sudo systemctl start apache2
    EOF
    tags = {
        Name = "${var.vpc_name}-server"
    }
  
}


resource "aws_instance" "jai_1" {
    count =1
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids =[aws_security_group.sg.id]
    subnet_id = aws_subnet.publicsubnets[0].id
    associate_public_ip_address = true
    user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update
    sudo apt-get install jenkins
    EOF
    tags = {
        Name = "${var.vpc_name}-publicserver"
    }
  
}