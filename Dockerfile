FROM almir/webhook:2.8.2

USER root

RUN apk add --update curl bash git github-cli jq docker docker-cli-compose && \
    rm -rf /var/cache/apk/*
RUN mkdir -p /.config && chmod 777 /.config

USER webhook

CMD ["-verbose", "-hooks=/etc/webhook/hooks.yaml", "-hotreload"]
