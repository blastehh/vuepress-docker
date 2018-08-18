FROM node:alpine
RUN yarn global add vuepress \
    && mkdir -p /root/src /root/html
COPY entrypoint.sh /entrypoint.sh
COPY generate.sh /generate.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]