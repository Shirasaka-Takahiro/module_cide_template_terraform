variable "general_config" {
  type = map(any)
}
variable "fargate_cpu" {}
variable "fargate_memory" {}
variable "tg_arn" {}
variable "ecr_repository" {}
variable "cloudwatch_log_group_name" {}
variable "public_subnet_ids" {}
variable "internal_sg_id" {}