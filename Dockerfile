ARG alpine_version=latest
FROM alpine:${alpine_version}
ARG buildno=1

WORKDIR /
WORKDIR app
WORKDIR build
# / + app + build = /app/build

RUN touch test.txt && echo "Hello World" >> test.txt
RUN apk add openjdk17
RUN cd .. \
	&& wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.31/bin/apache-tomcat-10.1.31.tar.gz \
	&& tar -xvzf apache-tomcat-10.1.31.tar.gz \
	&& rm apache-tomcat-10.1.31.tar.gz