#!/bin/bash

# For install the basic packages for development after a fresh Ubuntu installation.

sudo apt-get install -y aptitude
sudo apt-get install -y curl \
    zip gnupg flex bison gperf binutils build-essential

sudo apt-get install -y git gitg gitk vim \
    ctags \
    cscope \
    meld \
    p7zip-full \
    exfat-fuse \
    rpm \
    autoconf libtool \
    cmake

#sudo apt-get install tilda \ # GTK based drop down terminal
#    guake \ # Gnome based
#    yakuake # KDE based

sudo apt-get install -y fcitx-googlepinyin \
    fcitx-pinyin \
    fcitx-module-cloudpinyin \
    fcitx-pinyin \
    fcitx-sunpinyin \
    fcitx-ui-qimpanel \
    fcitx-table-wubi \
    fonts-arphic-ukai \
#    fonts-arphic-uming \
    language-pack-zh-hans \
    language-pack-gnome-zh-hans \
    \
    hyphen-en-gb \
    hunspell-en-gb \
    hunspell-en-au \
    hunspell-en-ca \
    hunspell-en-za \
    mythes-en-au \
    \
    firefox-locale-zh-hans \
    libreoffice-help-en-gb \
    libreoffice-l10n-zh-cn \
    libreoffice-l10n-en-za \
    thunderbird-locale-zh-hans \
    thunderbird-locale-zh-cn \
    thunderbird-locale-en-gb \
    libreoffice-l10n-en-gb \
    libreoffice-help-zh-cn \

sudo apt-get install -y chromium-browser \
    chromium-browser-l10n \
    chromium-codecs-ffmpeg \

sudo apt-get -y install texinfo gawk chrpath

# For android build.
#sudo apt-get install openjdk-8-jdk
#sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip

