.PHONY: all init build up up-d down exec bash docker docker-rm

# CONST

# VARIABLE
a=

all: exec


init:
	docker-compose build
	docker-compose run --rm app express . -f --view=ejs
	docker-compose run --rm app npm install

up:
	docker-compose up

up-d:
	docker-compose up -d

down:
	docker-compose down

exec:
	docker-compose exec app ${a}

bash:
	docker-compose exec app bash

###########################################################################################################
docker:
	docker system df -v

docker-rm:
	docker system prune -a --volumes