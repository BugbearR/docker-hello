USER_NAME=bugbearr
IMAGE_NAME=hello
REGISTRY=ghcr.io
REPO_NAME=${REGISTRY}/${USER_NAME}/${IMAGE_NAME}

.PHONY: all
all: .build

.PHONY: run 
run: .build
	@docker run ${REPO_NAME}

.PHONY: build
build: .build

.build: Dockerfile
	docker build . -t ${REPO_NAME}
	touch .build

.PHONY: clean
clean:
	rm .build
