FROM almir/webhook:2.8.2

USER root

RUN apk add --update curl bash git github-cli jq docker docker-cli-compose && \
    rm -rf /var/cache/apk/*
RUN mkdir -p /home/webhook/.config/git /home/webhook/.config/gh && chmod -R 1777 /home/webhook/.config

ENV XDG_CONFIG_HOME=/home/webhook/.config
ENV GIT_CONFIG_GLOBAL=/home/webhook/.config/git/config
ENV GH_CONFIG_DIR=/home/webhook/.config/gh

USER webhook

CMD ["-verbose", "-hooks=/etc/webhook/hooks.yaml", "-hotreload"]
