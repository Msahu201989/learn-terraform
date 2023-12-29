resource "aws_s3_bucket_object" "my_object" {
  bucket = "awswithlinux"
  key    = "my_snapshot"
  source = "snap-0fbb8d3a7d4576986"
}
