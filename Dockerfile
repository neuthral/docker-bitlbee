FROM debian:jessie
MAINTAINER dennis@moellegaard.dk

EXPOSE 6667
VOLUME ["/var/lib/bitlbee/"]

COPY bitlbee.key jgeboski.key build/
WORKDIR build/

ENV LANG en_US.UTF-8
ENV LC_ALL C.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# Prepare repositories
RUN echo 'deb http://code.bitlbee.org/debian/master/jessie/amd64/ ./' > /etc/apt/sources.list.d/bitlbee.list && \
    echo 'deb http://download.opensuse.org/repositories/home:/jgeboski/Debian_8.0 ./' > /etc/apt/sources.list.d/jgeboski.list && \
    apt-key add /build/bitlbee.key && \
    apt-key add /build/jgeboski.key

# Install dependencies and Facebook and Steam plugin
RUN apt-get -qy --force-yes update && \
    apt-get -qy --force-yes dist-upgrade && \
    apt-get -qy --force-yes upgrade && \
    apt-get -qy --force-yes install build-essential git mercurial autoconf libtool gettext \
                                    libglib2.0-dev libotr5-dev libgcrypt20-dev libpurple-dev libwebp-dev libjson-glib-dev libprotobuf-c-dev protobuf-c-compiler && \
    apt-get -qy --force-yes install bitlbee-libpurple bitlbee-dev && \
    apt-get -qy --force-yes install bitlbee-facebook bitlbee-steam

# Install Telegram plugin
RUN git clone --recursive https://github.com/majn/telegram-purple && \
    cd telegram-purple && \
    ./configure && \
    make && \
    make install && \
    cd ..

# Install Discord plugin
RUN git clone https://github.com/sm00th/bitlbee-discord.git && \
    cd bitlbee-discord && \
    ./autogen.sh && \
    BITLBEE_CFLAGS="-I/usr/include/bitlbee" BITLBEE_LIBS="/usr/lib/bitlbee" ./configure && \
    make && \
    make install && \
    cd ..

# Install skypeweb plugin
RUN git clone https://github.com/EionRobb/skype4pidgin.git && \
    cd skype4pidgin/skypeweb && \
    make && \
    make install && \
    cd ..

# Install Hangouts plugin
RUN hg clone https://bitbucket.org/EionRobb/purple-hangouts/ && \
    cd purple-hangouts && \
    make && \
    make install && \
    cd ..

# Clean up
RUN apt-get -qy purge git mercurial autoconf && \
    apt-get -qy autoremove && \
    rm -rf /tmp/* /var/tmp/* && \
    apt-get -qy clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /build

CMD ["/usr/sbin/bitlbee", "-D", "-n"]
