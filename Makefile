IMAGE      := dotfiles
WORKDIR    := /home/root/dotfiles

build:
	@docker build -t $(IMAGE) .
.PHONY: build

run:
	@docker run \
	-v $$(pwd):$(WORKDIR) \
	-ti $(IMAGE) bash
.PHONY: run

test:
	@docker run \
	-v $$(pwd):$(WORKDIR) \
	-ti $(IMAGE) \
	ansible-playbook bootstrap.yml
.PHONY: test

bootstrap:
	@ansible-playbook bootstrap.yml --ask-become-pass
.PHONY: bootstrap
