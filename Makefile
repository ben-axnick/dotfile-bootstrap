TAG=0.0.0
PROJECT=bentheax/dotfile-bootstrap
IMAGE=$(PROJECT):$(TAG)

build:
	docker build --rm -t $(IMAGE) .

push:
	docker push $(IMAGE)
	docker push $(PROJECT):latest

run:
	docker run --rm -it -p "80:8080" $(IMAGE)

tag:
	git tag $(TAG)
	git push --tags
