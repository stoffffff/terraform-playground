resource "null_resource" "backup_and_delete_s3" {

  provisioner "local-exec" {
    command = <<EOT
      set -e

      echo "Creating backup directory if it does not exist..."
      mkdir -p /opt/s3-backup

      echo "Copying S3 bucket contents to local directory..."
      aws s3 sync s3://botlane-bucket-1 /opt/s3-backup/

      echo "Deleting S3 bucket and all its contents..."
      aws s3 rb s3://botlane-bucket-1 --force

      echo "S3 bucket backup and deletion completed successfully."
    EOT
  }
}