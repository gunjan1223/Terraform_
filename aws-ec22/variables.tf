#instance type
variable "ec2_instance_type"{
    type = string
    default = "t2.micro"
}

#ami
variable "ami_id" {
    type = string
    default = "ami-0f3380f4b6e8b9dd0"
}

#root block device volume size
variable "root_block_device" {
    default = 15
    type = number
}