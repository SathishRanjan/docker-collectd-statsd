FROM alpine:3.4

MAINTAINER Greg Whitaker <gwhitake@gmail.com>

# Staging configuration files
COPY ["config", "/tmp/"]
COPY ["plugins", "/tmp/plugins/"]

# Add in startup script
COPY ["run.sh", "/run/"]
RUN chmod +x /run/run.sh

RUN apk update \
	&& apk upgrade \
	&& apk add py-pip collectd collectd-python

RUN pip install future --upgrade
RUN pip install statsd --upgrade

RUN rm -rf /etc/collectd
RUN mv /tmp/collectd /etc/

RUN mkdir -p /opt/collectd/plugins/python/
RUN cp /tmp/plugins/write_statsd/write_statsd.py /opt/collectd/plugins/python/write_statsd.py

# Execute the script run.sh in the shell
CMD /run/run.sh