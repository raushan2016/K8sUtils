
# Image URL to use all building/pushing image targets
IMAGE ?= raushan2016/modelmount:latest

# Build and Push the docker image
docker-deploy: docker-build docker-push

# Build the docker image
docker-build:
	docker build . -t ${IMAGE}
	
# Push the docker image.
docker-push:
	docker push ${IMAGE}
