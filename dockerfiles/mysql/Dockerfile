FROM centos
MAINTAINER bsydor@gmail.com

ADD ./mariadb.repo /etc/yum.repos.d/
RUN yum -y install MariaDB-server MariaDB-client && \
    yum clean all && \
    ln -sf /dev/stderr /var/lib/mysql/error.log
ADD ./server.cnf /etc/my.cnf.d/

CMD ["mysqld_safe", "--defaults-file=/etc/my.cnf"] 
EXPOSE 3306
