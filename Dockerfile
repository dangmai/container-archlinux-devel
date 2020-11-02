FROM archlinux:latest

LABEL maintainer="Dang Mai <contact at dangmai dot net>"

RUN pacman --noconfirm -Syu base-devel \
  && rm -rf /var/cache/pacman/pkg/*
RUN useradd builduser -m \
  && passwd -d builduser \
  && chmod 1000:1000 /run/user/1000 \
  && printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers # Allow the builduser passwordless sudo
USER builduser
WORKDIR /home/builduser
