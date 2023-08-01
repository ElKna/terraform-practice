provider "aws" {
    region = "ap-northeast-2"
}

resource "aws_iam_user" "this" {
  count = 4
  name = "trial-${count.index}"
}