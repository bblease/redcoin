redcoin:
	docker-compose up

clean: 
	docker system prune -f
	docker volume rm $(docker volume ls)

down:
	docker-compose down

redcoin-prod: 
	echo 'TODO'