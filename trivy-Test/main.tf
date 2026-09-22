# FICHIER DE TEST - misconfigurations Terraform volontaires
provider "aws" {
  region     = "eu-west-3"
  access_key = "AKIAQWERTYUIOP123456"
  secret_key = "k3Jf9sLmQ2xZpR7vT1uWyB8nCdE4gHaXoIiPqNrS"
}

resource "aws_s3_bucket" "public" {
  bucket = "mon-bucket-public-test"
  acl    = "public-read"
}

resource "aws_security_group" "open" {
  name        = "open-to-world"
  description = ""

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "db" {
  identifier          = "test-db"
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = "admin1234"
  publicly_accessible = true
  storage_encrypted   = false
  skip_final_snapshot = true
}

resource "aws_iam_policy" "admin" {
  name = "admin-all"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "*"
      Resource = "*"
    }]
  })
}
