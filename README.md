# Minimal Alpine based Openldap serer for Docker

Use the following to docker build then run 
```
docker build -t <name:tag> .
docker run -d -p 389:389 <name:tag>
```

You may also just pull and run the image hosted on Docker Hub
```
docker run -d -p 389:389 ry4nz/openldap4docker
```

By default, the slapd configuration is located at :` /etc/openldap/slapd.conf`.

Some key configurations are the following:
```
include		/etc/openldap/schema/core.schema
pidfile		/var/run/openldap/slapd.pid
argsfile	/var/run/openldap/slapd.args
database	mdb
maxsize		1073741824
suffix		"dc=my-domain,dc=com"
rootdn		"cn=Manager,dc=my-domain,dc=com"
rootpw		secret
index	objectClass	eq
```

Groups and users are added in `files/init.ldif`.  One may add new entities using the following:
```
ldapadd -x -c -H ldap://localhost -D "cn=Manager,dc=my-domain,dc=com" -w secret -f <new_file.ldif>
```
Note the admin and password is specified above.

To verify, one may use the following:

```
ldapsearch -H ldap://localhost -D "cn=Manager,dc=my-domain,dc=com" -w secret -b dc=my-domain,dc=com
```
