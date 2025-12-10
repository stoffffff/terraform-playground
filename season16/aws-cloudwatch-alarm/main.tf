resource "aws_cloudwatch_metric_alarm" "control_alarm" {
  alarm_name          = "rift's alarm"
  alarm_description   = "Alarm when EC2 CPU utilization exceeds 80% for 5 minutes"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  period              = 300            # 5 minutes
  evaluation_periods  = 1              # single evaluation period
  threshold           = 80
  comparison_operator = "GreaterThanThreshold"
  unit = "Percent"
}