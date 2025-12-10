resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name        = "rift-volume"
  }
}

resource "aws_ebs_snapshot" "snapshot" {
  volume_id = aws_ebs_volume.k8s_volume.id
  description = "Kubernetes Snapshot"
  tags = {
    Name = "rift-volume-ss"
  }
}