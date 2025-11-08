# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit cmake
DESCRIPTION="Rounds the corners of your windows in KDE Plasma 5 and 6"
HOMEPAGE="https://github.com/matinlotfali/KDE-Rounded-Corners"
SRC_URI="https://github.com/matinlotfali/KDE-Rounded-Corners/archive/v${PV}/KDE-Rounded-Corners-v${PV}.tar.gz"
S="${WORKDIR}/KDE-Rounded-Corners-${PV}"
LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sys-devel/gettext
         kde-plasma/kwin
         kde-frameworks/kconfigwidgets
         kde-frameworks/kcmutils"

DEPEND="${RDEPEND}"

BDEPEND="dev-build/cmake
         kde-frameworks/extra-cmake-modules"
