# See https://github.com/gentoo/gentoo-docker-images/blob/master/README.md#using-the-portage-container-in-a-multi-stage-build
FROM gentoo/portage:latest as portage

FROM gentoo/stage3-amd64:latest

COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

RUN emerge-webrsync -q && emerge --quiet-build=y app-portage/portage-utils \
    app-portage/gentoolkit net-misc/dhcpcd app-emulation/docker \
    dev-python/docker-py

# https://github.com/gliderlabs/docker-alpine/issues/437#issuecomment-494200575
VOLUME [ "/sys/fs/cgroup", "/dev" ]

CMD ["/sbin/init"]
