ALPINE_VERSION:=3.10.3
DOCKER_ORG:=alpine
DOCKER_IMAGE:=base

build: package
	docker build -t $(DOCKER_ORG)/$(DOCKER_IMAGE) .

get:
	wget --verbose --output-document alpine-rootfs.tar.gz "http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/alpine-minirootfs-$(ALPINE_VERSION)-x86_64.tar.gz";\

package: get
	mkdir -p -m 755 temp-rootfs
	tar --numeric-owner --xattrs --acls -C temp-rootfs -xf alpine-rootfs.tar.gz
	cp --recursive --preserve=timestamp --backup rootfs/* temp-rootfs/
	tar --numeric-owner --xattrs --acls -C temp-rootfs -c . -f docker-alpine.tar
	

clean:
	rm -rf temp-rootfs
	rm -f docker-alpine.tar
	rm -f  alpine-rootfs.tar.gz

.PHONY: get package build clean
