
VOLUME_IDS = $(shell docker volume ls -q)

IMAGES = $(shell docker images  -q)

all:
	cd srcs/ && docker-compose up --build

up: 
	cd srcs/ && docker-compose up --build -d

down: 
	cd srcs/ && docker-compose  down

clean: down
	docker volume rm -f $(VOLUME_IDS)
	docker rmi -f $(IMAGES)
fclean:
	sudo rm -rf /home/imaaitat/data/wp/*
	sudo rm -rf /home/imaaitat/data/db/*
re: down all


