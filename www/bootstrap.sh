#!/bin/bash

## OSX only steps

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Doing OSX install of yadm"

  # Brew can be fiddly, install separately:
  # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  hash brew 2>/dev/null || (echo "install brew first" && exit 1)

  if hash yadm 2>/dev/null; then
    echo "yadm appears to be installed"
  else
    brew tap TheLocehiliosan/yadm
    brew update
    brew install git yadm
  fi
fi

## Other OS

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo "Doing Debian install of yadm"

  if hash yadm 2>/dev/null; then
    echo "yadm appears to be installed"
  else
    echo "installing git"
    sudo apt-get install -y git

    echo "installing yadm"
    sudo apt-get install alien dpkg-dev debhelper build-essential

    VERSION="1.02-1"
    curl -fLO https://dl.bintray.com/thelocehiliosan/rpm/yadm-${VERSION}.noarch.rpm
    sudo alien -k yadm-${VERSION}.noarch.rpm
    sudo dpkg -i yadm-${VERSION}_all.deb
  fi
fi

# Have ensured that yadm is available
hash yadm 2>/dev/null || (echo "yadm install failed" && exit 1)

## Extra packages

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "getting some important extra brew packages"
  brew install zsh tmux vim
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo "installing some essential packages"
  sudo apt-get install -y zsh vim-nox tmux
fi

## Clone dotfiles

ssh-add -l | grep "8a:db:c8:ca" || (echo "SSH key not loaded" && exit 1)

# fresh clone if required
yadm clone git@bitbucket.org:baxnick/settings.git && \
  yadm checkout -f && \
  yadm perms && \
  yadm alt && \

# always update submodules
yadm submodule update --init --recursive
