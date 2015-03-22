FROM centos
MAINTAINER bsydor@gmail.com

RUN yum -y install tar && yum clean all
RUN curl -L  https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz -o etcd-v0.4.6-linux-amd64.tar.gz && \
    tar xzvf etcd-v0.4.6-linux-amd64.tar.gz && \
    mv etcd-v0.4.6-linux-amd64/etcd /usr/sbin/etcd && \
    rm -rf etcd-v0.4.6-linux-amd64*
ADD ./run.sh /

VOLUME /etcd

EXPOSE 4001
EXPOSE 7001
WORKDIR /etcd

CMD ["/run.sh"]
