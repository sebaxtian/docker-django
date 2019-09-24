# docker-django
Docker configuration for Django Applications


## First of all
* Read ALL README.md file
* Clone a Django 2.2.5 LTS project repository into the src/ directory
* Configure the .env file, see the example.env file and save copy with name .env
* There are two enviroment work flow:
  - Develop
  - Production


#### Flow Work to Develop Enviroment
* Build Docker Image Only Once
```bash
$ ./build.sh
```
* Run Docker Container
```bash
$ ./run.sh
```
* Run Docker Container (ONLY ON WINDOWS see PWD_WINDOWS in example.env file)
```bash
$ ./run.sh W
```
* Run Shell into Docker Container
```bash
$ ./shell.sh
```


#### Flow Work to Production Enviroment (FUTURE WORK)
* ...
* ...


#### Build Container
###### See example.env file
###### See build.sh script file
```bash
$ docker build $(for i in `cat .env | grep -v '#'`; do out+="--build-arg $i " ; done; echo $out;out="") -t sebaxtian/docker-django:1.0.0 .
```

#### Run Container
###### See example.env file
###### See run.sh script file
```bash
$ docker run -it --name docker-django --env-file $PWD/.env -v $PWD/src/$DIR_APP:/home/python/src -p $PORT_APP:$PORT_APP sebaxtian/docker-django:1.0.0
```

#### Start Container
```bash
$ docker start docker-django
```

#### See logs Container
```bash
$ docker logs docker-django
```

#### Restart Container
```bash
$ docker restart docker-django
```

#### Shell in Container
###### See shell.sh script file
```bash
$ docker exec -it docker-django bash
```

#### Erase Container
```bash
$ docker rm docker-django
```

#### Erase Container Image
```bash
$ docker image rm sebaxtian/docker-django:1.0.0
```

#### Docker Commands

* List Docker images
```bash
$ docker image ls
```

* List Docker containers (running, all, all in quiet mode)
```bash
$ docker container ls
$ docker container ls --all
$ docker container ls -aq
```
