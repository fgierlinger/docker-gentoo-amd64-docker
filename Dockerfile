FROM fgierlinger/gentoo-amd64:latest

RUN emerge --quiet-build=y app-emulation/docker dev-python/docker-py

# https://github.com/gliderlabs/docker-alpine/issues/437#issuecomment-494200575
VOLUME [ "/sys/fs/cgroup", "/dev" ]

CMD ["/sbin/init"]
