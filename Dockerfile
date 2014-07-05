FROM debian:jessie
ENV VERSION 2.24
ENV RELEASE 2.24.2
RUN apt-get update -q
RUN apt-get install -qy curl build-essential
RUN mkdir /src
WORKDIR /src
RUN curl https://www.kernel.org/pub/linux/utils/util-linux/v$VERSION/util-linux-$RELEASE.tar.gz \
     | tar -zxf-
RUN ln -s util-linux-$RELEASE util-linux
WORKDIR /src/util-linux
RUN ./configure --without-ncurses
RUN make LDFLAGS=-all-static nsenter
RUN cp nsenter /
ADD docker-enter /docker-enter
ADD installer /installer
CMD /installer
