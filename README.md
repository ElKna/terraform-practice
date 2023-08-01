## terraform-practice

Terraform 실습을 하면서 기록을 저장하는 용도의 리포

aws 계정을 콘솔에 등록해 둔 상태에서
```bash
terraform apply
```
를 하면 연습용 IAM Role 및 Policy가 생성됨

생성 이후 삭제 시
```bash
terraform destory
```
를 하면 생성했던 리소스들이 삭제됨