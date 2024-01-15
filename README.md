# jinnliong_assignment3.4
# _SCPT CLOUD INFRASTRUCTURE ENGINEERING_
## Objectives
- Create a simple "Hello World" application in a python.
- Use Docker to create a container image of the "Hello World" application.
- Use the command line to run the container and verify that the application works as expected.

## Steps
1. Create app.py and type in the contents below
### Simple web application using Flask framework
from flask import Flask

import os

HOSTNAME = os.getenv('HOSTNAME', 'Flask')
app = Flask(__name__)

@app.route("/")
def hello_world():
    return f"<p>Hello from {HOSTNAME}</p>"

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080)

2. Run the below command to ensure "Hello, World" display in the command line
```sh
python3 hello_world.py
```

3. Create the Dockerfile and type in the below contents.
### Using latest base image  from DockerHub
FROM python:latest

#Creating working directory inside container
WORKDIR /app

#Copy source code into working directory inside container
COPY . /app

#Install flask inside container
RUN pip install -r requirements.txt

#Expose container port
EXPOSE 8080

#Start flask app
ENTRYPOINT ["python"]
CMD ["app.py"]

4. Create requirements.txt and type in the below content.
flask

5. Build the main.tf to run the docker image
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

### Configure the docker provider
terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using since new versions are released frequently
        docker = {
      source  = "kreuzwerker/docker"
      version = "~>3.0.2"
    }
  }
}

### Configure the docker provider
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

6. Run the terraform code.
```sh
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

7. Otherwise run the command below manually to run the docker app.
Build a docker image locally 
```sh
docker build -t flask-app .
```

Listing your built images 
```sh
docker images
```

Starting your local container with port mapping from host port to container port(-p) and in detached mode(-d)
```sh
docker run -d -p 8080:8080 flask-app
```

List your running containers
```sh
docker ps
```

List all your containers(Running and stopped)
```sh
docker ps -a
```sh

To stop and remove your container
```sh
docker stop <container ID>
docker rm <container ID>
```

To remove your docker images
```sh
docker rmi <image ID>
```