FROM almir/webhook:2.8.2

USER root

RUN apk add --update curl bash git github-cli jq docker docker-cli-compose && \
    rm -rf /var/cache/apk/*

USER webhook

CMD ["-verbose", "-hooks=/etc/webhook/hooks.yaml", "-hotreload"]
