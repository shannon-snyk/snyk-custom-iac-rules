resource "aws_iam_role" "denied" {
  name = "denied"
  assume_role_policy = jsonencode({
      Version   = "2012-10-17"
      Statement = [
        {
          Action    = "sts:AssumeRole"
          Effect    = "Allow"
          Sid       = ""
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        },
      ]
  })
  tags = {
    description = "a tag that describes something"
  }
}