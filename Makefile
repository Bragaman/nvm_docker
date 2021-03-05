export IMAGE ?= nvm

export CWD = $(shell pwd)
export NGINX_VERSION ?= 1.19.3
export NVM_VERSION ?= $(shell curl -s https://api.github.com/repos/kaltura/nginx-vod-module/tags | jq -r '.[0] | .name')

export VIDEO_DIR ?= ${CWD}/videos
export CONF_PATH ?= ${CWD}/examples/nginx.conf
export JSON_PATH ?= ${CWD}/examples/json
export CECRIPT ?= ${CWD}/examples/cecript.xml

.PHONY: build_latest run ffmpeg_encript

build_latest:
	docker build --build-arg VOD_MODULE_VERSION=${NVM_VERSION} --build-arg NGINX_VERSION=${NGINX_VERSION} -t ${IMAGE}:latest .


run:
	docker run --rm -ti \
	-v ${CONF_PATH}:/etc/nginx/nginx.conf \
	-v ${JSON_PATH}:/opt/static/json \
	-v ${VIDEO_DIR}:/opt/static/videos/ \
	-p 3030:80 \
	${IMAGE}:latest

ffmpeg_encript:
	ffmpeg -y -i ${VIDEO_DIR}/file.mp4 \
	-vcodec copy -acodec copy \
	-encryption_scheme cenc-aes-ctr \
	-encryption_key 76a6c65c5ea762046bd749a2e632ccbb \
	-encryption_kid a7e61c373e219033c21091fa607bf3b8 \
	${VIDEO_DIR}/encript_file.mp4