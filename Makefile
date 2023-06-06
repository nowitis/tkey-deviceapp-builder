
# image produced by build-image targets
BUILDIMAGENAME=tkey-deviceapp-builder-local

# default image used when running a container
IMAGE=ghcr.io/nowitis/tkey-deviceapp-builder:latest

all:
	@echo "Targets:"
	@echo "run                   Run a shell using image '$(IMAGE)' (Podman)"
	@echo "pull                  Pull down the image '$(IMAGE)' (Podman)"
	@echo "build-image           Build a toolchain image named '$(BUILDIMAGENAME)' (Podman)"
	@echo "                      A newly built image can be used like: make IMAGE=$(BUILDIMAGENAME) run"
	@echo "docker-run            Run a shell using image '$(IMAGE)' (Docker)"
	@echo "docker-build-image    Build a toolchain image named '$(BUILDIMAGENAME)' (Docker)"

run:
	podman run --rm --mount type=bind,source="`pwd`/../",target=/build -w /build -it \
	 $(IMAGE) /usr/bin/bash

docker-run:
	docker run --rm --mount type=bind,source="`pwd`/../",target=/build -w /build -it \
	 $(IMAGE) /usr/bin/bash

pull:
	podman pull $(IMAGE)

build-image:
	podman build -t $(BUILDIMAGENAME) .

docker-build-image:
	docker build -t $(BUILDIMAGENAME) .
