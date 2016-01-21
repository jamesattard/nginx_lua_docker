FROM centos

MAINTAINER James Attard "info@jamesattard.com"

# Install compilation tools and other 
RUN yum update -y && yum groupinstall -y "Development Tools"

# Install OpenResty prerequisites
RUN yum update -y && yum install -y \ 
    postgresql-devel \
    readline-devel \ 
    pcre-devel \
    openssl-devel \
    wget

# Compile
RUN wget https://openresty.org/download/ngx_openresty-1.9.3.1.tar.gz && \
    tar zxvf ngx_openresty-1.9.3.1.tar.gz && \
    cd ngx_openresty-1.9.3.1 && \
    ./configure --with-pcre-jit --with-ipv6 --without-http_redis2_module --with-http_iconv_module --with-http_postgres_module -j32 && \
    make && make install

# Bootstrapping stuff 
ADD .pgpass /root
ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
ADD bootstrap/*.sh /tmp/bootstrap/
RUN chmod 600 ~/.pgpass

# Copy entrypoint script into the image
ADD docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
