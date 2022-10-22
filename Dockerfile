FROM golang:1.19-alpine as build

RUN apk add curl tar gzip libc-dev git
COPY build.sh /build.sh
RUN chmod +x /build.sh && /build.sh

FROM node:16-alpine

RUN yarn global add vuepress@1.9.2 \
    && yarn add -D vuepress@1.9.2 @vuepress/plugin-pwa@1.9.2 @vuepress/plugin-medium-zoom@1.9.2 \
    && mkdir -p /root/src /root/html \
    && apk add rsync curl git
COPY --from=build /usr/local/bin/webhook /usr/local/bin/webhook
COPY entrypoint.sh /entrypoint.sh
COPY vuepress-webhook.sh /vuepress-webhook.sh
COPY hooks.json /hooks.json
COPY generate.sh /generate.sh
RUN chmod +x /vuepress-webhook.sh
EXPOSE 9000
ENTRYPOINT ["sh", "/entrypoint.sh"]
