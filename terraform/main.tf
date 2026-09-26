module "ecr" {
  source = "./modules/ecr"

  images_repository_name    = var.images_repository_name
  manifests_repository_name = var.manifests_repository_name
}