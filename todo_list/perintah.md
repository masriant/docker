~ docker ps
~ docker stop <container_id>
~ docker rm -f <container_id>
~ docker rmi $(docker images | grep "^<none>" | awk '{print $3}') 
~ docker build --no-cache -t myapp .

~ docker image ls
~ docker image ls -a
~ docker run -d -p 80:80 --name my-running-app myapp
~ curl http://localhost/

# Create a new container from an existing one.
~ docker cp <container>:<path> <host>:<path> or docker cp <container>:/<path>/<file> <host>/<path>/<file>
~ docker create -v /myvol1 -v /myvol2 --name my-persistent-app myapp
~ docker start -a -i my-persistent-app
~ docker logs my-persistent-app
~ docker exec -it my-persistent-app bash
~ exit
~ docker diff my-persistent-app
~ docker commit -m "Added a log message" -a "DockerTraining" my-persistent-app myapp/v2
~ docker tag myapp/v2 training/myapp
~ docker push training/myapp

~ docker image pull redis:latest
~ docker run -d --name myredis -p 6379:6379 -v /data:/data redis:latest
~ docker exec -it myredis bash 
~ docker image rm <name_image>:<tag>
~ docker image rm redist:latest

~  exit
~ docker image  prune -y
~  docker container stats $(docker ps -aq)
~  docker system df
~ 
~ docker cp ./myfile.txt e85412b0eacd:/tmp
~ docker image rm  $(docker image ls -q|grep -v '^<none>'|head -n  1) 

# inside the container, install node.js and npm
/usr/local/bin/node -v
apt update && apt install -y curl
curl -sL https://deb.nodesource.com/setup_12.x | /usr/local/bin/bash -
/usr/local/bin/npm install -g pm2
pm2 start process.json
exit

~ docker image  build
<s>docker build -t my-image .
# OR use the Dockerfile in the current directory.
docker build -f ./Dockerfile -t my-image:latest .

# Run a container from an image with the name "my-container" and map port 80 to port 8080 on the host machine.
# Run a command inside a container
docker run --rm -it my-image /bin/bash

# Map port 8080 of the host to port 80 of the container
docker run -p 8080:80 my-image

# Set an environment variable
docker run -e "MY_VARIABLE=hello" my-image

# Mount a volume from the host into the container
docker run -v /path/on/host:/path/in/container my-image

