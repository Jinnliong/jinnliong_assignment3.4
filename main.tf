terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using
    # since new versions are released frequently
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>3.0.2"
    }
  }
}

# Configure the docker provider
provider "docker" {
}

resource "docker_image" "hello_world" {
  name = "app:latest"
  build {
    context = "." # Assuming Dockerfile is in the current directory
  }
}

resource "docker_container" "app_container" {
  name    = "app-container" # Replace with your desired name
  #command = ["app.py", "-g", "daemon off;"]
  image   = docker_image.hello_world.name # Use image_name attribute
  ports {
    internal = 8080
    external = 8080
  }
}
