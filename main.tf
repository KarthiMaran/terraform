terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.1"
    }
  }
}

provider "docker" {}

# Pull the Nginx mage
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Run the container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx"
  ports {
    internal = 80
    external = 8000
  }
}
