FROM centos:centos7

COPY . /opt/blog

RUN cd /opt \
  && curl -O -J -L https://github.com/gohugoio/hugo/releases/download/v0.40.3/hugo_0.40.3_Linux-64bit.tar.gz \
  && tar -xf hugo_0.40.3_Linux-64bit.tar.gz \
  && rm hugo_0.40.3_Linux-64bit.tar.gz \
  && yum -y install ruby \
  && yum clean all \
  && rm -rf /var/cache/yum \
  && gem install asciidoctor --no-user-install

EXPOSE 1313

WORKDIR /opt/blog

CMD ["/opt/hugo","server","--bind","0.0.0.0"]