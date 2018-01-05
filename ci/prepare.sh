#!/bin/sh

export CI_BUILD_SHA="x${CIRCLE_SHA1:0:8}"

docker() {
	command docker "$@"
}

# Automatically install docker-cloud
docker_cloud() {
	if ! which docker-cloud >/dev/null 2>/dev/null; then
		# Install Docker Cloud
		sudo apt-get install python python-pip >/dev/null
		pip install docker-cloud >/dev/null
	fi

	command docker-cloud "$@"
}

docker_tag_push() {
	echo Build image...

	docker build -t $CIRCLE_PROJECT_REPONAME:$1 .

	echo Tagging docker image...
	docker tag $CIRCLE_PROJECT_REPONAME:$1 $2:$3

	echo ${CIRCLE_PROJECT_REPONAME} "$2:$3"
}
