FROM archlinux:latest

RUN pacman --noconfirm -Syu base-devel \
  && rm -rf /var/cache/pacman/pkg/*
RUN useradd builduser -m \
  && passwd -d builduser \
  && printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers # Allow the builduser passwordless sudo
USER builduser
WORKDIR /home/builduser