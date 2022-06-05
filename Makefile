USER_NAME=bugbearr
IMAGE_NAME=hello
REGISTRY=ghcr.io
REPO_NAME=${REGISTRY}/${USER_NAME}/${IMAGE_NAME}
REPO_VER=latest

.PHONY: all
all: .build_done

.PHONY: run 
run: .build_done
	@docker run ${REPO_NAME}

.PHONY: build
build: .build_done

.build_done: Dockerfile
	docker build . -t ${REPO_NAME}
	touch .build_done

.PHONY: test
test:
	-docker stop test-${IMAGE_NAME}
	-docker rm test-${IMAGE_NAME}
	docker run --name test-${IMAGE_NAME} ${REPO_NAME}:${REPO_VER} >/tmp/result.txt
	diff /tmp/result.txt expected.txt
	-docker rm test-${IMAGE_NAME}

.PHONY: clean
clean:
	rm .build_done
