singularity shell -B /home -B /usr/local /home/billy/storage/bacarena_docker/bacarena_docker_v1.0.0.sif

docker container run -it -v /home/billy:/home/billy parkinsonlab/bacarena_docker:v1.0.2


docker container run -it -v D:/bacarena_docker:/bacarena_docker parkinsonlab/bacarena_docker:v1.0.2