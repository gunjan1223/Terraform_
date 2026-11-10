#keypair
resource "aws_key_pair" "my_key" {
    key_name = "terra-key-ec2"
    public_key = file("terra-key-ec2.pub")
}

#vpc creation
resource aws_default_vpc default {
  
}

resource aws_security_group "My_security_group" {
   name = "Automate-SG"
   description = "Security group for EC2 instance"
   vpc_id = aws_default_vpc.default.id

    #inbound rule
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "ssh open"
    }

    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "http open"
    }

    #outbound rule
    egress{
        from_port = 0 
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "all traffic"
    }

    tags = {
        Name = "Automate-SG"
    }
}

#EC2 instance creation
resource "aws_instance" "WebServer" {
   key_name = aws_key_pair.my_key.key_name
   security_groups = [aws_security_group.My_security_group.name]
   instance_type = "t2.micro"
   ami = "ami-0f3380f4b6e8b9dd0"

   root_block_device {
     volume_size = 10
     volume_type = "gp3"
   }
   tags = {
     Name = "MyServer"
   }
}