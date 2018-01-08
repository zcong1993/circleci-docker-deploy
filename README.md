# circleci-docker-deploy

> circleci workflow auto build and deploy docker image, because docker cloud auto build is very very slow...

[![CircleCI](https://circleci.com/gh/zcong1993/circleci-docker-deploy/tree/master.svg?style=svg)](https://circleci.com/gh/zcong1993/circleci-docker-deploy/tree/master)

[Dockerhub](https://hub.docker.com/r/zcong/circleci-docker-deploy/tags/)

## Settings

Set `DOCKERCLOUD_USER` and `DOCKERCLOUD_APIKEY` to `Circleci Project Environment Variables`.

Replace `docker_push zcong/circleci-docker-deploy:production` to your image in `cloud.docker.com`

## Note

Share cache between two jobs will cost a few minutes when building large docker image, so you should use `circle.not.split.yml` config, which not split `build` and `deploy`.

## License

MIT &copy; zcong1993
