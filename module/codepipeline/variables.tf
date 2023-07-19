variable "general_config" {
  type = map(any)
}
variable "iam_codepipeline_arn" {}
variable "bucket_name" {}
variable "full_repositroy_id" {}
variable "branch_name" {}
variable "codebuild_project_name" {}
variable "ecs_cluster_arn" {}
variable "ecs_cluster_name" {}
variable "codestarconnections_connection_arn" {}