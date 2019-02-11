# docker-alpine

This is a minimal alpine linux docker image.
To build it simply run
```
sudo make
```

All that happens is, that we pull the alpine minirootfs tarball, adds files from rootfs/ and makes it into a docker image.

For all those like me, who like to build their containers from scratch and know what we are running, this is a way cleaner and simpler approach than using the 200 SLOC official script.
