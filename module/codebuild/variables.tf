variable "general_config" {
  type = map(any)
}
variable "regions" {
  type = map(any)
}
variable "iam_codebuild_arn" {}
variable "github_url" {}
variable "vpc_id" {}
variable "public_subnet_ids" {}
variable "internal_sg_id" {}