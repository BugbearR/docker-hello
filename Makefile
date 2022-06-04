USER_NAME=bugbearr
IMAGE_NAME=hello
REGISTRY=ghcr.io
REPO_NAME=${REGISTRY}/${USER_NAME}/${IMAGE_NAME}

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
	docker run ${REPO_NAME} >/tmp/result.txt
	diff /tmp/result.txt expected.txt

.PHONY: clean
clean:
	rm .build_done
