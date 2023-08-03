provider "aws" {
    region = "ap-northeast-2"
}

# resource "aws_iam_user" "this" {
#   count = 4
#   name = "trial-${count.index}"
# }

# output "users" {
#     # value = aws_iam_user.this[0].name
#     value = aws_iam_user.this[*].name
# }

# variable "users" {
#     # type = object({
#     #   rex       = string
#     #   vincent   = string
#     #   june      = string
#     # })
#     type = map(string)
#     default = {
#         "rex"       = "/path1/"
#         "vincent"   = "/path2/"
#         "june"      = "/path3/"
#     }
# }

# resource "aws_iam_user" "this" {
#     for_each    = var.users
#     name        = each.key
#     path        = each.value
# }

# output "test" {
#     # value = aws_iam_user.this
#     # 아래 명령어는 key와 value를 통해 새로운 key, value를 생성하는 명령어임
#     value = { for k, v in aws_iam_user.this : k => v.arn}
#     # 아래 명령어는 위와 비슷하지만 List로 만들게 됨
#     # value = [for _, v in aws_iam_user.this : v.arn]
# }



# Dynamic Block
variable "settings" {
    default = {
        a = {
            namespace   = "123"
            name        = "1"
            value       = "124151"
        }
        b = {
            namespace   = "asdf"
            name        = "asdf"
            value       = "asdf"
        }
    }
}

resource "aws_elastic_beanstalk_application" "tftest" {
  name        = "tf-test-name"
  description = "tf-test-desc"
}

resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "tf-test-name"
  application         = aws_elastic_beanstalk_application.tftest.name
  solution_stack_name = "64bit Amazon Linux 2015.03 v2.0.3 running Go 1.4"

  dynamic "setting" {
    for_each = var.settings
    content {
        namespace   = setting.value["namespace"]
        name        = setting.value["name"]
        value       = setting.value["value"]
    }
  }
}