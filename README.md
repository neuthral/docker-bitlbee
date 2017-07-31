docker-bitlbee
==============

This repo provides the steps necessary to build a
[BitlBee](http://www.bitlbee.org/) docker image.

This bitlbee includes the following plugins:
* [Facebook](https://wiki.bitlbee.org/HowtoFacebookMQTT)
* [Telegram](https://github.com/majn/telegram-purple)
* [Steam](https://github.com/jgeboski/bitlbee-steam)
* [Discord](https://github.com/sm00th/bitlbee-discord/)
* [SkypeWeb](https://wiki.bitlbee.org/HowtoSkypeWeb)
* [Hangouts](https://bitbucket.org/EionRobb/purple-hangouts)

Docker registry
---------------

This image is available at: [hub.docker.com/r/aairey/bitlbee/](https://hub.docker.com/r/aairey/bitlbee/)

Usage
-----

It exposes port 6667 and use volume `/var/lib/bitlbee` for configuration files.

```shell
$ docker run -d --name=bitlbee -v /var/volumes/bitlbee:/var/lib/bitlbee/ aairey/bitlbee
```

After this you can use your regular IRC client to connect to port 6667 of the container/host's IP address.

Build
-----

If you would like to build this image manually, run:

```shell
$ git clone https://github.com/aairey/docker-bitlbee
$ docker build --rm -t aairey/bitlbee .
```

Thanks
------

Got inspiration from:

* [dennismp/bitlbee](https://github.com/dennis/docker-bitlbee)
* [deviavir/docker-bitlbee](https://github.com/DeviaVir/docker-bitlbee)
