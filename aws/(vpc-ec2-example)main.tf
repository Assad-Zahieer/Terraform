provider "aws" {
  version = "< 2"
  
  region  = "us-west-2" # Oregon
}
#Strings must be enclosed in double quotes (HCL)

terraform init

resource "aws_vpc" "web_vpc" {
  cidr_block           = "192.168.100.0/24"
  enable_dns_hostnames = true

  tags {
    Name = "Web VPC"
  }
}

terraform apply

#The cidr_block is the only required argument for an aws_vpc resource.

#Create subnet for EC2 instance
resource "aws_subnet" "web_subnet_1" {
  vpc_id            = "${aws_vpc.web_vpc.id}"
  cidr_block        = "192.168.100.0/25"
  availability_zone = "us-west-2a"

  tags {
    Name = "Web Subnet 1"
  }
}

terraform apply 

#Add EC2 to subnet
resource "aws_instance" "web" {
  ami           = "ami-0fb83677"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.web_subnet_1.id}"
  
  tags {
    Name = "Web Server 1"
  }
}

terrafrom apply

#Deleting Resources
sed -i '/.*web_subnet_1.*/,$d' main.tf
This deletes all the lines in the configuration file starting from the line that declares web_subnet_1.
