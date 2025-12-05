variable "name" {
  type    = set(string)
  default = ["akshan", "lucian", "miss-fortune", "jinx", "draven"]
}
variable "ami" {
  default = "ami-0c9bfc21ac5bf10eb"
}
variable "instance_type" {
  default = "t2.nano"
}
variable "key_name" {
  default = "jade"
}
