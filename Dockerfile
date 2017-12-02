FROM debian:stretch

ENV LANG C.UTF-8
ENV SHELL /bin/bash

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y \
  ctags \
  curl \
  gcc \
  git \
  g++ \
  gnupg \
  gtimelog \
  haskell-stack \
  ipython3 \
  make \
  msmtp \
  mutt \
  libc6-dev \
  libffi-dev \
  libgmp-dev \
  neovim \
  newsbeuter \
  pass \
  python3 \
  python-pip \
  python3-pip \
  remind \
  tmux \
  wget \
  xz-utils \
  zlib1g-dev \
  zsh

RUN pip3 install \
  ansible \
  pipenv \
  proselint

RUN mkdir /home/root

WORKDIR /home/root/dotfiles
