IMAGE_NAME = "ansible"
GIT_HASH := $(shell git rev-parse --short HEAD)

CONTAINER_SUBSYS?="podman"

BUILD_ARGS ?= 

default: all

.PHONY: all
all: build tag

.PHONY: build
build:
	${CONTAINER_SUBSYS} build ${BUILD_ARGS} -t ${IMAGE_NAME}:${GIT_HASH} .

.PHONY: tag
tag:
	${CONTAINER_SUBSYS} tag ${IMAGE_NAME}:${GIT_HASH} ${IMAGE_NAME}:latest

.PHONY: cleanup-bootstrap
cleanup-bootstrap:
	${CONTAINER_SUBSYS} stop bootstrap
	${CONTAINER_SUBSYS} rm bootstrap

