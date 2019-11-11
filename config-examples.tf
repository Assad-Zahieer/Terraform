#providers - https://www.terraform.io/docs/providers/index.html

provider "google" {
    alias = "west"
    project = "cl-terraform"
    region= "us-west1"
}

#resources - https://www.terraform.io/docs/configuration/resources.html
resource "aws_instance" "web" {
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
}

#Full examples with aws https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples
