FROM alpine:latest
ENV VERSION=1.0

LABEL \
	org.label-schema.maintainer="me codar nl" \
	org.label-schema.name="squid" \
	org.label-schema.description="Squid running on Alpine Linux" \
	org.label-schema.version="${VERSION}" \
	org.label-schema.vcs-url="https://github.com/githubcdr/docker-squid" \
	org.label-schema.schema-version="1.0"

RUN apk add --update --no-cache curl ca-certificates s6 squid

# add files, this also creates the layout for the filesystem
COPY files/root/ /

# fixups
RUN    chmod a+x /service/*/run

# ready to run
EXPOSE 3128/tcp

# manage with s6
ENTRYPOINT ["/bin/s6-svscan","/service"]
