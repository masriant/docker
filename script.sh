
# FROM Instruction
docker build -t mazri3/from from

docker image ls

# RUN Instruction
docker build -t  mazri3/run run

# Hapus RUN
docker image rm  mazri3/run

# RUN layout & no cache
docker build -t mazri3/run run --progress=plain --no-cache

docker image ls
docker image ls | grep mazri3

# CMD Instruction
docker build -t  mazri3/command command

docker image inspect mazri3/command


docker container create --name command mazri3/command
docker container start command
docker container ls
docker container ls -a | grep command
docker container logs command

# LABEL INSTRUCTION
docker build -t mazri3/label label
docker image inspect mazri3/label
