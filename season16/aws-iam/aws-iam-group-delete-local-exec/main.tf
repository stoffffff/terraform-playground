resource "aws_iam_group" "this" {
  name = "iamgroup_ravi"
}

resource "null_resource" "delete_iam_group"{
  provisioner "local-exec"{
  command = "aws iam delete-group --group-name iamgroup_ravi"
  }
}