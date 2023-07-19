##Codepipeline
resource "aws_codepipeline" "pipeline" {
  name     = "${var.general_config["project"]}-${var.general_config["env"]}-pipeline"
  role_arn = var.iam_codepipeline_arn

  artifact_store {
    location = var.bucket_name
    type     = "S3"
  }

  ##Source Stage
  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.codestarconnections_connection_arn
        FullRepositoryId = var.full_repositroy_id
        BranchName       = var.branch_name
      }
    }
  }

  ##Build Stage
  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"
      configuration = {
        ProjectName = var.codebuild_project_name
      }
    }
  }

  ##Deploy Stage
  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
        ClusterName = var.ecs_cluster_arn
        ServiceName = var.ecs_cluster_name
        FileName    = "imagedef.json"
      }
    }
  }
}