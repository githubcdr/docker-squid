FROM alpine:latest
MAINTAINER Taco Hamers me_codar.nl

RUN apk add --update --no-cache curl ca-certificates s6 squid

# add files, this also creates the layout for the filesystem
COPY files/root/ /

# fixups
RUN    chmod a+x /service/*/run

# ready to run
EXPOSE 3128/tcp

# manage with s6
ENTRYPOINT ["/bin/s6-svscan","/service"]
