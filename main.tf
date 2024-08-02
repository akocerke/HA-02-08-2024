provider "aws" {
  region = "eu-central-1"
}

variable "vpc_id" {
  description = "ID des bestehenden VPCs"
}

variable "security_group_id" {
  description = "ID der bestehenden Sicherheitsgruppe"
}

variable "subnet_id" {
  description = "ID des Subnetzes, in dem die EC2-Instanz erstellt wird"
}

variable "key_name" {
  description = "Name des SSH-Schlüsselpaares für die EC2-Instanz"
}

# Erstelle die EC2-Instanz
resource "aws_instance" "laugensstange_2" {
  ami           = "ami-013efd7d9f40467af"  # Ersetze dies durch die tatsächliche AMI-ID
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  # Öffentliche IP-Adresse automatisch zuweisen
  associate_public_ip_address = true

  tags = {
    Name = "laugensstange-2"
  }
}

# Outputs
output "instance_id" {
  value = aws_instance.laugensstange_2.id
}

output "public_ip" {
  value = aws_instance.laugensstange_2.public_ip
}