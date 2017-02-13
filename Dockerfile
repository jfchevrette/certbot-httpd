FROM centos:7

RUN sh -x && \
    yum -y install epel-release && \
    yum -y install certbot httpd && \
    yum clean all && \
    chmod 777 /run/httpd /var/www/html

COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY cert-updater.sh /

EXPOSE 8080

CMD ["httpd", "-DFOREGROUND"]
