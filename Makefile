# Configurable variables
IMAGE_NAME=quarm-db
IMAGE_TAG=latest
REGISTRY_USER=gpascale
FULL_IMAGE_NAME=$(REGISTRY_USER)/$(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: build push run clean

## Build the Docker image
build:
	docker buildx build \
		--platform linux/amd64 \
		--load \
		-t $(IMAGE_NAME):$(IMAGE_TAG) .

## Tag and push to Docker Hub
push:
	docker buildx build \
		--platform linux/amd64 \
		--push \
		-t $(FULL_IMAGE_NAME) .

## Run the container locally (for testing)
run: build
	@docker-compose -f "./docker-compose.yml" up

## Remove built image (for cleanup)
clean:
	docker rm -f $(IMAGE_NAME) || true
	docker rmi -f $(IMAGE_NAME):$(IMAGE_TAG) || true