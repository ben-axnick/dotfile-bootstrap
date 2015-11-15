TAG=0.0.4
PROJECT=bentheax/dotfile-bootstrap
IMAGE=$(PROJECT):$(TAG)

build:
	docker build --rm -t $(IMAGE) .
	docker tag -f $(IMAGE) $(PROJECT):latest

push:
	docker push $(IMAGE)
	docker push $(PROJECT):latest

run:
	IMAGE=$(IMAGE) docker-compose up

run-daemon:
	IMAGE=$(IMAGE) docker-compose up -d

tag:
	git tag $(TAG)
	git push --tags
