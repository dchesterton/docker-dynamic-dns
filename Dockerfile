FROM alpine:latest
RUN apk --update --no-cache add curl
COPY no-ip.sh /no-ip.sh
CMD /bin/sh /no-ip.sh
