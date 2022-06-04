USER_NAME=bugbearr
IMAGE_NAME=hello
REPO_NAME=${USER_NAME}/${IMAGE_NAME}

.PHONY: run 
run: .build
	docker run ${REPO_NAME}

.PHONY: build
build: .build

.build: Dockerfile
	docker build . -t ${REPO_NAME}
	touch .build

