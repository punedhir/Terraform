variable "ip" {}

variable "root" {}

provider "docker" {
  host = "tcp://${var.ip}:2375/"
}
resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
}
resource "docker_container" "nginx-server" {
  name = "nginx-server"
  image = "${docker_image.nginx.latest}"
  ports {
    internal = 80
}
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path = "/home/scrapbook/tutorial/www"
    read_only = "true"
    }
}

resource "null_resource" "Test" {
  connection {
	type = "ssh"
	user = "rony"
	password = "${var.root}"
        host = "${var.ip}"
  } 
  provisioner "remote-exec" {
	script = "./eample/puppet.sh"
    }
}
