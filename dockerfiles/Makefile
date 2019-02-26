build:
	docker build -t $(REPOSITORY)/$(IMAGE):$(TAG) .

interactive:
	docker run -ti --rm --name $(IMAGE) $(REPOSITORY)/$(IMAGE):$(TAG)

cleancontainers:
	@-docker rm $$(docker ps -a | grep Exited | awk '{print $$1}')

cleanimages: cleancontainers
	docker rmi $$(docker images | grep none | awk '{print $$3}')

removeimage:
	docker rmi $(REPOSITORY)/$(IMAGE):$(TAG)

extract: 
	@-docker rm conf
	mkdir -p conf
	docker run --name conf $(REPOSITORY)/$(IMAGE):$(TAG) echo
	docker cp conf:/opt/graphite/conf .
	docker rm conf

.PHONY: build interactive removeimage cleanimages cleancontainers
