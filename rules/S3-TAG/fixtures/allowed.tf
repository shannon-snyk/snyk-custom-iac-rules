resource "aws_s3_bucket" "test" {
  tags = { 
    name = "km_blob_storage_test" 
    }
}
