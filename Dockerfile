FROM fgierlinger/gentoo-amd64:latest

RUN emerge --quiet-build=y app-emulation/docker dev-python/docker-py

CMD ["/sbin/init"]
