FROM node:alpine
RUN yarn global add vuepress \
    && mkdir -p /root/src /root/html \
    && apk add rsync curl git
RUN curl -sL https://github.com/adnanh/webhook/releases/download/2.6.9/webhook-linux-amd64.tar.gz | tar -xvz; \
    mv webhook-linux-amd64/webhook /usr/local/bin/webhook; rmdir webhook-linux-amd64
COPY entrypoint.sh /entrypoint.sh
COPY vuepress-webhook.sh /usr/local/bin
COPY hooks.json hooks.json
COPY generate.sh /generate.sh
EXPOSE 9000
ENTRYPOINT ["sh", "/entrypoint.sh"]