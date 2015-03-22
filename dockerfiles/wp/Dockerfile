FROM centos
MAINTAINER bsydor@gmail.com

RUN yum -y install tar httpd php php-mysql && \
    ln -sf /dev/stdout /var/log/httpd/access_log && \
    ln -sf /dev/stderr /var/log/httpd/error_log

RUN curl -L -o /usr/local/bin/wp https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp
RUN rm -rf /var/www/html && cd /var/www && \
    curl -O https://wordpress.org/latest.tar.gz && \
    tar xf latest.tar.gz && \
    mv wordpress html && \
    chown -R apache:apache html

ADD ./run.sh /run.sh
ADD ./wp-config.php /var/www/html/

CMD ["/run.sh"]
EXPOSE 80
