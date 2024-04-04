terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "nginx" {
  name = "tomee_latest"
}

# Create a container
resource "docker_container" "bar" {
  image = docker_image.nginx.latest
  name  = "bar"
}
