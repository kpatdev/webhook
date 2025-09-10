FROM almir/webhook

USER root

RUN apk add --update curl bash git github-cli && \
    rm -rf /var/cache/apk/*

USER webhook

CMD ["-verbose", "-hooks=/etc/webhook/hooks.yaml", "-hotreload"]