FROM seegno/bitcoind:0.13-alpine

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ gosu

ADD /setuidgid.inc .
ADD /entrypoint.sh .
RUN chmod u+x /entrypoint.sh

EXPOSE 8333
CMD [ "bitcoind", "-printtoconsole" ]