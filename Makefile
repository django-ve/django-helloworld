ifndef TAG
$(error The TAG variable is missing.)
endif
 
ifndef ENV
$(error The ENV variable is missing.)
endif
 
ifeq (,$(filter $(ENV),prod))
COMPOSE_FILE_PATH := -f docker-compose-dev.yml
endif


ifeq (,$(filter $(ENV),dev))
COMPOSE_FILE_PATH := -f docker-compose-prod.yml
endif
 
trivy-scan:
	docker run -u 0 --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --ignore-unfixed django-helloworld_web:$(TAG) 
	docker run -u 0 --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --ignore-unfixed django-helloworld_traefik:$(TAG) 
	docker run -u 0 --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --ignore-unfixed django-helloworld_db:$(TAG) 

build:
	$(info Make: Building "$(ENV)" environment images.)
	@TAG=$(TAG) docker-compose $(COMPOSE_FILE_PATH) build --no-cache
	@make trivy-scan

start:
	$(info Make: Starting "$(ENV)" environment containers.)
	@make build
	@TAG=$(TAG) docker-compose $(COMPOSE_FILE_PATH) up -d
 
stop:
	$(info Make: Stopping "$(ENV)" environment containers.)
	@docker-compose $(COMPOSE_FILE_PATH) stop
 
restart:
	$(info Make: Restarting "$(ENV)" environment containers.)
	@make -s stop
	@make -s start

push:
	$(info Make: Pushing "$(TAG)" tagged image.)
	@docker push $(IMAGE):$(TAG)
 
pull:
	$(info Make: Pulling "$(TAG)" tagged image.)
	@docker pull $(IMAGE):$(TAG)
 
clean:
	@docker system prune --volumes --force
 
login:
	$(info Make: Login to Docker Hub.)
	@docker login -u $(DOCKER_USER) -p $(DOCKER_PASS)