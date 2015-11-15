TAG=0.0.0
PROJECT=bentheax/dotfile-bootstrap
IMAGE=$(PROJECT):$(TAG)

build:
	docker build --rm -t $(IMAGE) .

push:
	docker push $(IMAGE)

run:
	docker run --rm -it -p "8080:8080" $(IMAGE)

tag:
	git tag $(TAG)
	git push --tags