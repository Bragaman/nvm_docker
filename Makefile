export IMAGE ?= nvm

export CWD = $(shell pwd)
export NGINX_VERSION ?= 1.19.3
export NVM_VERSION ?= $(shell curl -s https://api.github.com/repos/kaltura/nginx-vod-module/tags | jq -r '.[0] | .name')

export VIDEO_DIR ?= ${CWD}/videos
export CONF_PATH ?= ${CWD}/examples/nginx.conf
export JSON_PATH ?= ${CWD}/examples/json

.PHONY: build_latest

build_latest:
	docker build --build-arg VOD_MODULE_VERSION=${NVM_VERSION} --build-arg NGINX_VERSION=${NGINX_VERSION} -t ${IMAGE}:latest .


run:
	docker run --rm -ti \
	-v ${CONF_PATH}:/etc/nginx/nginx.conf \
	-v ${JSON_PATH}:/opt/static/json \
	-v ${VIDEO_DIR}:/opt/static/videos/ \
	-p 3030:80 \
	${IMAGE}:latest
	