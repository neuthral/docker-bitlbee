docker-bitlbee
==============

![](https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Slack_CMYK.svg/800px-Slack_CMYK.svg.png)
added slack-libpurple!

slack-libpurple guide:
https://www.linuxjournal.com/content/what-really-ircs-me-slack

Usage
-----
Next, you'll need to add what Slack calls a Legacy API token, which tells me at some point Slack will deprecate this and leave us out in the cold again. To do this, make sure you are logged in to Slack in your web browser, and then visit https://api.slack.com/custom-integrations/legacy-tokens. On that page, you will have the ability to generate API tokens for any Slack networks where you are a member. Once you have the API token, go back to your Bitlbee console and set it:

```
account add slack username@networkname.slack.com
account slack set api_token xoxp-jkdfaljieowajfeiajfiawlefje
account slack on
```

```
chat add slack general
/join #general

channel general set auto_join true
```

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
