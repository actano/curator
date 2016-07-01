FROM alpine:3.4

RUN apk --no-cache add python py-pip \
    && pip install elasticsearch-curator==4.0.0

STOPSIGNAL SIGKILL
COPY ./files /

CMD ["crond", "-f", "-d", "8", "-l", "8"]
