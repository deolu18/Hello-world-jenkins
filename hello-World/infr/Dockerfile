FROM alpine:3.10.2
RUN apk --no-cache add \
        bash \
        python3 \
        curl \
    && pip3 install --upgrade pip \
    && pip3 install awscli \
    && rm -rf /root/.cache

COPY ./hello.sh hello.sh
ENTRYPOINT [ "sh", "./hello.sh" ]