# main.tf
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "secret-scan-demo-public-bucket"
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "demo_bucket" {
  bucket                  = aws_s3_bucket.demo_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_security_group" "demo_sg" {
  name        = "demo-sg"
  description = "Demo security group with open SSH"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}