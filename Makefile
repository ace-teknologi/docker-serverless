SERVERLESS_VERSION = 1.71.1
IMAGE_NAME ?= amaysim/serverless:$(SERVERLESS_VERSION)
TAG = $(SERVERLESS_VERSION)

build:
	docker build --build-arg SERVERLESS_VERSION=$(SERVERLESS_VERSION) -t $(IMAGE_NAME) .

pull:
	docker pull $(IMAGE_NAME)

shell:
	docker run --rm -it -v $(PWD):/opt/app $(IMAGE_NAME) bash

tag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)
