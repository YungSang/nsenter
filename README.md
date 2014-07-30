# nsenter

An nsenter tool box

- `nsenter` from https://www.kernel.org/pub/linux/utils/util-linux/
- `docker-enter` from https://github.com/YungSang/docker-attach


## How to install

### for Intel 64 bits platforms

```
$ docker run --rm -v /usr/local/bin:/target yungsang/nsenter
```

### for boot2docker

```
docker@boot2docker:~$ curl -sSL https://raw.githubusercontent.com/YungSang/nsenter/yungsang/nsenter/boot2docker-nsenter | sh
```
