build:
	docker build . -t pthomison/tailscale:localbuild

RUN_CONTAINER=docker run -it --rm pthomison/tailscale:localbuild

shell: build
	$(RUN_CONTAINER) /bin/zsh

tag:
	docker tag pthomison/tailscale:localbuild  pthomison/tailscale:latest
	docker tag pthomison/tailscale:localbuild  pthomison/tailscale:$(shell git rev-parse --short HEAD)

push:
	docker push pthomison/tailscale:localbuild  pthomison/tailscale:latest
	docker push pthomison/tailscale:localbuild  pthomison/tailscale:$(shell git rev-parse --short HEAD)