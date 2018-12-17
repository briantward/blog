FROM centos:centos7

# OpenShift docker build is dropping the .git folder
# which is very annoying...
# So we will do our own git clone later
#COPY . /opt/blog

RUN cd /opt \
  && curl -O -J -L https://github.com/gohugoio/hugo/releases/download/v0.40.3/hugo_0.40.3_Linux-64bit.tar.gz \
  && tar -xf hugo_0.40.3_Linux-64bit.tar.gz \
  && rm hugo_0.40.3_Linux-64bit.tar.gz \
  && yum -y install ruby git \
  && yum clean all \
  && rm -rf /var/cache/yum \
  && gem install asciidoctor --no-user-install \
  && git clone https://github.com/briantward/blog.git



EXPOSE 1313

WORKDIR /opt/blog

CMD ["/opt/hugo","server","--bind","0.0.0.0"]
