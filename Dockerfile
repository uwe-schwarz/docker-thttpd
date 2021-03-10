FROM alpine

LABEL maintainer "Uwe Schwarz <uwe@iq42.de>"

RUN apk --no-cache add thttpd bash
RUN curl -L https://github.com/shenwei356/csvtk/releases/latest/download/csvtk_linux_amd64.tar.gz | tar -xzC /usr/local/bin/

WORKDIR /var/www/http

EXPOSE 80

ENTRYPOINT ["/usr/sbin/thttpd"]
CMD ["-D",  "-l", "/dev/stderr", "-d", "/var/www/http", "-c", "**.sh"]
