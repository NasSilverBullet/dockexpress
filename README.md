# dockexpress

## This is a tool to develop express app on docker

### If you want to use this...
```bash
$ git clone https://github.com/NasSilverBullet/dockexpress.git
$ cd dockexpress
```

### If you want to create new app...
```bash
$ make init
```

### If you want to start the container...
```bash
$ make up # docker-compose up
```
or
```bash
$ make up-d # docker-compose up -d
```
**Happy hacking!!**


### If you want to inject new processes with docker exec...
```bash
$ make a='npm install'
```

### If you want to create a new bash session in the container...
```bash
$ make bash
```