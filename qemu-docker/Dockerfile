FROM debian:stretch
LABEL maintainer="Yunhui Fu <yhfudev@gmail.com>"


ENV LANG C.UTF-8

# Install qemu binfmt
RUN set -x; \
        apt-get update \
        && apt-get install -y --no-install-recommends vim-nox netcat \
            ca-certificates \
            curl \
            qemu qemu-user qemu-user-static binfmt-support


# Copy entrypoint script and patch file
COPY ./entrypoint.sh /
COPY ./run.sh /
COPY ./headers-debian-byteshift.patch /tmp/

# Mount /target_root to the target root directory of rootfs
RUN mkdir -p /target_root
VOLUME ["/target_root"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["compile"]

