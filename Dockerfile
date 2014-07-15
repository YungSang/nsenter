FROM debian:jessie

ENV VERSION 2.24
ENV RELEASE 2.24.2

RUN apt-get update -q && apt-get install -qy curl build-essential

RUN mkdir /src && \
    cd /src && \
    curl https://www.kernel.org/pub/linux/utils/util-linux/v$VERSION/util-linux-$RELEASE.tar.gz \
     | tar -zxf- && \
    ln -s util-linux-$RELEASE util-linux

RUN cd /src/util-linux && \
    ./configure --without-ncurses && \
    make LDFLAGS=-all-static nsenter && \
    cp nsenter /

RUN curl -L https://raw.githubusercontent.com/YungSang/docker-attach/master/docker-nsenter -o /docker-enter && \
    chmod +x /docker-enter

ADD installer /installer

CMD /installer
