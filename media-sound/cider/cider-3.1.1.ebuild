# Copyright 2011-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop xdg unpacker
DESCRIPTION="A cross-platform Apple Music experience built on Vue.js and written from the ground up with performance in mind."
HOMEPAGE="https://cider.sh"
LICENSE="no-source-code"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="mirror bindist strip"
SRC_URI="https://repo.cider.sh/apt/pool/main/${PN}-v${PV}-linux-x64.deb"
RDEPEND="x11-libs/gtk+
         dev-libs/nss
         media-libs/alsa-lib
         sys-libs/libxcrypt
         x11-libs/libnotify
         media-video/ffmpeg[chromium]"
S="${WORKDIR}"
src_unpack() {
    unpack_deb ${A}
}
src_install() {
    dodir /usr/lib
    insinto /usr/lib
    doins -r usr/lib/cider
    dodir /usr/bin
    dobin usr/bin/cider
    dodir /usr/share/doc
    insinto /usr/share/doc/${P}
    doins -r usr/share/doc/cider/*
    dodir /usr/share/lintian/overrides
    insinto /usr/share/lintian/overrides
    doins -r usr/share/lintian/overrides/cider
    dodir /usr/share/pixmaps
    insinto /usr/share/pixmaps
    doins usr/share/pixmaps/cider.png
    domenu usr/share/applications/cider.desktop
}



