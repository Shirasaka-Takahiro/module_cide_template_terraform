##IAM Role
resource "aws_iam_role" "default_role" {
  name               = var.role_name
  assume_role_policy = file("${path.module}/ecs_json/fargate_task_assume_role.json")
}

##IAM Role Policy
resource "aws_iam_role_policy" "default_policy" {
  name   = var.policy_name
  role   = aws_iam_role.default_role.name
  policy = file("${path.module}/ecs_json/task_execution_policy.json")
}