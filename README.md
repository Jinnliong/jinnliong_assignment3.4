# jinnliong_assignment3.4
# _SCPT CLOUD INFRASTRUCTURE ENGINEERING_
## Objectives
- Create a simple "Hello World" application in a python.
- Use Docker to create a container image of the "Hello World" application.
- Use the command line to run the container and verify that the application works as expected.

## Steps
1. Create app.py and type in the contents as per in the respective file

2. Run the below command to ensure "Hello, World" display in the command line
```sh
python3 hello_world.py
```

3. Create the Dockerfile and type in the below contents as per in the respective file

4. Create requirements.txt and type in the below content as per in the respective file

5. create the main.tf nd type in the below content as per in the respective file

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