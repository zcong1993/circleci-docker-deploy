#!/bin/sh

export CI_BUILD_SHA="x${CIRCLE_SHA1:0:8}"

docker() {
	if [ ! -e ~/.docker/config.json ]; then
		command docker login -u $DOCKERCLOUD_USER -p $DOCKERCLOUD_APIKEY
	fi

	command docker "$@"
}

# Automatically install docker-cloud
docker_cloud() {
	# if ! which docker-cloud >/dev/null 2>/dev/null; then
	# 	# Install Docker Cloud
	# 	sudo apt-get install python python-pip >/dev/null
	# 	pip install docker-cloud >/dev/null
	# fi

	# command docker-cloud "$@"
	echo Tag image...
	docker tag $CIRCLE_PROJECT_REPONAME:$CI_BUILD_SHA $1/$2:$3
	echo Push to docker cloud...
	docker push $1/$2:$3
}

docker_build() {
	echo Build image...
	docker build -t $CIRCLE_PROJECT_REPONAME:$CI_BUILD_SHA .
}
