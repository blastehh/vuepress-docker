FROM node:alpine
RUN yarn global add vuepress \
    && mkdir -p /root/src /root/html \
    && apk add rsync
COPY entrypoint.sh /entrypoint.sh
COPY generate.sh /generate.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]