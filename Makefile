build:
	docker build . -t pthomison/tailscale:localbuild

RUN_CONTAINER=docker run -it --rm pthomison/tailscale:localbuild

GIT_REV=$(shell git rev-parse --short HEAD)

shell: build
	$(RUN_CONTAINER) /bin/zsh

tag: build
	docker tag pthomison/tailscale:localbuild  pthomison/tailscale:latest
	docker tag pthomison/tailscale:localbuild  pthomison/tailscale:$(GIT_REV)

push: tag
	docker push pthomison/tailscale:latest
	docker push pthomison/tailscale:$(GIT_REV)

clean:
	docker rmi \
		pthomison/tailscale:localbuild \
		pthomison/tailscale:latest
