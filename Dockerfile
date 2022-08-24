FROM tailscale/tailscale:v1.29.125

RUN apk update && apk upgrade

RUN apk add zsh dumb-init socat python3 py3-pip