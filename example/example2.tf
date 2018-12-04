variable "ip" {}

variable "root" {}

provider "docker" {
  host = "tcp://${var.ip}:2375/"
}
resource "docker_image" "tomcat" {
  name = "redis:latest"
}
resource "docker_container" "tomcat-server" {
  name = "tomcat-server"
  image = "${docker_image.tomcat.latest}"
}

