#### Load variables from .env file ####
-include .env
ifeq ($(wildcard .env),) 
	export $(shell sed 's/=.*//' .env)
endif

MAKEFILE_DIRECTORY := $(dir $(CURRENT_MAKEFILE))
BUILD_IMAGE ?= "wireshark-build-image"
CONTAINER_ENGINE ?= "docker"
	

all:
	$(MAKE) docker
	$(MAKE) clean
	$(MAKE) build-appimage

docker: Dockerfile
	$(CONTAINER_ENGINE) build -t $(BUILD_IMAGE) .

clean:
	rm -Rf "$(MAKEFILE_DIRECTORY)Wireshark" && rm -Rf "$(MAKEFILE_DIRECTORY)out"

build-appimage:
	$(CONTAINER_ENGINE) run --rm -it --name wireshark-build \
		-v "$(CURDIR):/data:z" \
		--network=host \
		--cap-add SYS_ADMIN \
		--device /dev/fuse \
		--security-opt apparmor:unconfined \
		$(BUILD_IMAGE)

