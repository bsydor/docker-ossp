FROM centos
MAINTAINER bsydor@gmail.com

ADD ./nginx.repo /etc/yum.repos.d/

RUN yum -y install nginx && \
    sed -i '1s;^;daemon off\;\n;' /etc/nginx/nginx.conf && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.7.1/confd-0.7.1-linux-amd64 -o /usr/sbin/confd && \
    chmod +x /usr/sbin/confd

ADD ./wp-nginx.toml /etc/confd/conf.d/wp-nginx.toml
ADD ./wp-nginx.tmpl /etc/confd/templates/wp-nginx.tmpl
ADD ./run.sh /run.sh

CMD ["/run.sh"]
EXPOSE 80
