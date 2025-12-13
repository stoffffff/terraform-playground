resource "aws_opensearch_domain" "search" {
  domain_name = "sr-domain"

  engine_version = "OpenSearch_2.11"

  cluster_config {
    instance_type = "t3.small.search"
  }
}
