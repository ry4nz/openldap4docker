FROM alpine:3.4

MAINTAINER Ryan Zhang <ryan.zhang@docker.com>

RUN apk add --no-cache busybox musl libldap libltdl libsasl libuuid openldap openldap-clients

ADD files /ldap

RUN slapadd -v -l /ldap/init.ldif 

EXPOSE 389 636

CMD slapd -d 256

