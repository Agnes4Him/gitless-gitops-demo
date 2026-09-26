output "images_repository_url" {
  value = aws_ecr_repository.images.repository_url
}

output "manifests_repository_url" {
  value = aws_ecr_repository.manifests.repository_url
}
