ARG APACHE_VERSION=2.4
FROM httpd:${APACHE_VERSION}

COPY containers/httpd/httpd-vhosts.conf.template /tmp/
COPY .env /tmp/
RUN apt-get update \
        && apt-get install -y gettext \
        && export $(grep -v '^#' /tmp/.env | xargs) \
        && envsubst < /tmp/httpd-vhosts.conf.template > /tmp/httpd-vhosts.conf \
        && mv /tmp/httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf \
        && rm -f /tmp/.env /tmp/httpd-vhosts.conf.template
