##### image
~ docker image ls
~ docker image ls -a
~ docker run -d -p 80:80 --name my-running-app myapp
~ curl http://localhost/

# create image
~ docker image pull <name_image>:<tag>
~ docker image pull redis:latest

# delete image
~ docker image rm <name_image>
~ docker image rm <name_image> [:<tag>] [--force]
~ docker image rm $(docker images --filter "dangling=true" -q)
~ docker image rm <container ID or container name/image name>
~ docker image rm 7efac3591470
~ docker rmi $(docker images -q)   # remove all dangling (not associated with a container) images
~ docker system prune -a      # remove all unused images (both dangling and not dangling)

## Memory Limit 
~ docker container create --name smallnginx --memory --cpu 0.5 --publish 8081:80 nginx:latest
~ docker container start  smallnginx
~ docker logs -f smallnginx
~  curl localhost:8081
~  docker stop smallnginx
~
## CPU CFS (Completely Fair

### Bind Mounting
~ mkdir mongo-data
~ pwd
~ /e/docker/todo_list
~ cd  ..
~ ls
~ cd  todo_list
~ docker run -d \
             -v todo-db:/var/lib/mongodb \
             -v /e/docker/todo_list:/etc/todolist \
             -w /etc/todolist \
             -p 8201:8080 \
             --restart always \
             --name todolist \
             jcobler/mean
             
~ docker exec -ti todolist bash
~ cp config.js config.example.js
~ vi config.js
~ exit
~ docker restart todolist

~ docker container create --name mongodata --publish 27018:27017 --mount "type=bind,source=/e/docker/todo_list/mongo-data,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=mazrie --env MONGO_INITDB_ROOT_PASSWORD=mazrie mongo:latest

~ docker container create --name monggodata --publish 27019:27017 --mount "type=bind,source=/e/docker/todo_list/mongo-data,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=mazrie --env MONGO_INITDB_ROOT_PASSWORD=mazrie mongo:latest

~ docker container start mongodata
~ docker container start monggodata

~ docker container stop mongodata
~ docker container stop monggodata

~ docker container rm mongodata
~ docker container rm monggodata


### VOLUME
~ docker volume ls
~ docker volume create <name_volume>
~ docker volume create mongodata

~ docker container start mongodata
~ docker container stop mongodata

~ docker container start mongovolume
~ docker container stop mongovolume

~ docker volume rm <name_volume>
~ docker volume rm mongodata

~ docker container create --name mongovolume --publish 27020:27017 --mount "type=volume,source=mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=mazrie --env MONGO_INITDB_ROOT_PASSWORD=mazrie mongo:latest

~ docker container create --name monggovolume --publish 27021:27017 --mount "type=volume,source=monggodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=mazrie --env MONGO_INITDB_ROOT_PASSWORD=mazrie mongo:latest

~ docker volume rm <name_volume> -d local   # specify the driver, default is "local"
                                                # other drivers are "nfs", "azure", ...
~ docker run -d -v <name_volume>:<path_in_container> <image>
~ docker ps -a
~ docker inspect todo_db


##### container
~ docker ps
~ docker container ls
~ docker container ls -a
~ docker container create --name <name_container> <name_image:tag>
~ docker container create --name contohredis2 redis:latest
~ docker container start contohredis2 
~ docker container start  -i contohredis2    #interactive mode
~ docker attach contohredis2                 #attach to running container
~ docker exec -it contohredis bash           #run new command in already running container
~ docker cp /path/of/local/file contohredis:/path/of/remote/directory
~ docker stop contohredis
~ docker kill contohredis
~ docker container rm contohredis                       #delete the container but keep the image
~ docker rmi <Image Id> -f                     #delete the image




docker container ls
docker container ls -a
docker container create --name contohredis redis:latest
docker container start -ia contohredis
docker exec -it contohredis bash
exit        #close the terminal, will also close the container

docker container stop contohredis
docker container kill contohredis
docker container rm contohredis
docker container create --name contohredis2 redis:latest
docker container start contohredis2
docker container stop contohredis2
docker container stop Contohredis
docker container rm Contohredis
docker container rm contohredis2
docker container logs contohredis
docker container -f logs contohredis

docker exec -i -t  contohredis /bin/bash
    ~ ls
    ~ cd /
    ~  vi conf/redis.conf
    ~ redis-cli
        ~ set masrianto "Masrianto.com"
        ~ get masrianto
        ~ exit
    ~ exit

### sebelum menggunakan container
1. install redis di local machine, buka terminal dan ketik :
   `redis-server &`

2. buat client untuk menyimpan data ke server redis, buka terminal lain dan ketik :
   `redis-cli &`    

3. simpan data dengan perintah `set key value`, misalnya `set masrianto "Masrianto.Com"`
4. tampilkan isi dari key tersebut dengan perintah
`get key`. Misalnya `get masrianto`
5. tutup semua client dengan perintah `ctrl + c`</s>

### CONTOH AKSES DI BROWSER
docker container create --name <name_container> -p
docker container create --name <name_container> --publish  8080:80 <image_id>:<tag>
docker container create --name contohnginx --publish  8080:80 nginx:latest 
docker container start <name_container>
docker container start contohnginx
http://localhost:8080
docker container stop contohnginx


### MONGODB
MONGO_INITDB_ROOT_USERNAME: root
MONGO_INITDB_ROOT_PASSWORD: root

docker image pull mongo:latest
~ docker container create --name contohmongo --publish  27017:27017 --env MONGO_INITDB_ROOT_USERNAME=mazrie --env MONGO_INITDB_ROOT_PASSWORD=mazrie mongo:latest

~ docker container start contohmongo
~ docker container stop contohmongo



docker container stats 
CTRL + C



--env MONGO_INITDB_ROOT_USERNAME=root \
--env MONGO_INITDB_ROOT_PASSWORD=root \

mongo:latest

bash -c 'echo "from db import init_db;init_db()" > /app/    start.py'

python




docker container stats contohredis -a          #show statistics of cpu, memory etc. for containers

docker cp ./test.txt contohredis:/home/
docker cp contohredis:/etc/passwd .


### Docker Networking ###
docker network create --subnet=<subnet> <network-name>
docker network connect <container name or id> <network name or id>
docker network disconnect <container name or id> <network name or id>

## Docker Compose
~ docker container start <container name or id> 
~ docker stop <container_id>
~ docker rm -f <container_id>
~ docker rmi $(docker images | grep "^<none>" | awk '{print $3}') 
~ docker build --no-cache -t myapp .
~ docker ps -l
~ docker container stats <container ID or container name>


# Create a new container from an existing one.
~ docker cp <container>:<path> <host>:<path> or docker cp <container>:/<path>/<file> <host>/<path>/<file>

# create & run container from an image
~ docker container run [-d] [-p <port>:]<port>] [-v /path/on/host:/path/in/container[:ro]] [--restart=(no|on-failure|always)] [ ]
~ docker container run [-d] [--name <name>] [--restart=no|always|on-failure[://<max retry times>]] [--gpus all | all=[major.minor...]
~ docker container run -it ubuntu bash       #interactive tty, bash shell
~ docker container run -dt ubuntu bash               #detached (-d) interactive (-t    
# run container from an image
~ docker container run --name <container name> -d <image name>[:<tag>]
~ docker container run --name webserver -d nginx:latest

~ docker ps                    # list running containers
~ docker ps -a                 # list all containers, including those not running
~ docker start <container name or id>  # starts a stopped container
~ docker stop <container name or id>   # stops a running container
~ docker kill <container name or id>   # kills a running container, SIGKILL
~ docker attach <container name or id> # interactive terminal session with a running container
~ docker logs <container name or id>   # view the logs of a container
~ docker cp <file path in the container> : <local file path>  # copy files/folders from the container to local machine
~ docker cp <file path in the container> : <local file path>  # copy files/folders from the container to local filesystem
~ docker cp <file/dir to copy> <container name or id>:<location in container>
~ docker exec -it <container name or id> /bin/bash    # open a bash shell on a running container
# run container from the image
~ docker container run --detach --publish 6379:6379
--name my-redis \
--env ALLOW_EMPTY_PASSWORD=yes \
redis:latest
# check if the container is running
~ docker container ps
~ docker container logs my-redis
# connect to the container and execute some command
~ docker container exec -it my-redis bash
root@0514e82fefd8:/data# exit
~ docker container stop my-redis
~ docker container rm my-redis


##### container start
~ docker container start -i <container name or id>      # interactive mode
~ docker container start -t <container name or id>        # TTY mode


~ docker container create --name contohredis2 redis:latest
~ docker container ls -l            # show latest created container
~ docker container rename oldName newName
~ docker system df                # shows disk usage
~ docker system prune             # remove unused data


# create network
~ docker network create --driver bridge mynet
~ docker network connect <network-id or network-name> <container name or id>
~ docker network disconnect <network-id or network-name> <container name or id>



docker image create --name mongodb mongo:latest
docker container create --name mongodb mongo:latest

docker container create --name mongodbexpress 
docker network create mongonetwork

docker container start mongodb
docker container start mongodbsxpress






~ docker network ls
~ docker network create --driver bridge contohnetwork
~ docker network rm contoh network

## eksekusi network
docker network create --driver bridge mongonetwork

docker container create mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=mazrie --env MONGO_INITDB_ROOT_PASSWORD=mazrie mongo:latest

docker container create mongodbexpress --network mongonetwork --env ME_CONFIG_MONGODB_URL:  mongodb://mazrie:mazrie@mongodb:27017/ mongo-express:latest

docker container create --name mongodb mongo:latest
docker container start mongodb
docker container start mongodbexpress

docker container stop mongodb
docker container stop mongodbexpress

docker neytwork disconnect mongonetwork mongodb
docker network connect mongonetwork mongodb express_db



## mongo
ME_CONFIG_MONGODB_ADMINUSERNAME: root
ME_CONFIG_MONGODB_ADMINPASSWORD: secret
ME_CONFIG_MONGODB_URL:  mongodb://root:secret@mongo:27017/

ME_CONFIG_MONGODB_URL:  mongodb://admin:secret@mongo:27017/admin



## mongo-express
ME_CONFIG_MONGODB_AUTH_DATABASE='db'
ME_CONFIG_MONGODB_AUTH_USERNAME='admin'
ME_CONFIG_MONGODB_AUTH_PASSWORD='pass'

ME_CONFIG_BASICAUTH_USERNAME=''
ME_CONFIG_BASICAUTH_PASSWORD=''

ME_CONFIG_MONGODB_PORT=27017
ME_CONFIG_MONGODB_SERVER='mongo'