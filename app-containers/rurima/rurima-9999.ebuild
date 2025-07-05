EAPI=8
inherit autotools
DESCRIPTION="Run docker & LXC images without docker or LXC program, without kernel features support, even without root privileges!"
HOMEPAGE="https://github.com/Moe-hacker/rurima"
if [[ ${PV} == 9999* ]]; then 
    inherit git-r3
	EGIT_REPO_URI="https://github.com/Moe-hacker/rurima.git"
else
    SRC_URI="https://github.com/Moe-hacker/rurima/archive/refs/tags/v${PV}.tar.gz"
    KEYWORDS="~amd64 ~aarch64"
fi
LICENSE="MIT"
SLOT="0"

RDEPEND="sys-libs/libcap
         sys-libs/libseccomp
         app-arch/tar
         app-arch/xz-utils
         app-arch/gzip
         sys-apps/file
         sys-apps/coreutils
         app-misc/jq"

DEPEND="${RDEPEND}"
BDEPEND="dev-build/autoconf"

src_prepare() {
    default
    eautoreconf
}

src_install() {
    dobin rurima
    ewarn "From the ruri & rurima developers: "
    ewarn "For production, I fully recommand you to use tools like app-containers/crun, "
    ewarn "youki (currently not packaged in any overlay), app-containers/containerd, app-containers/docker, "
    ewarn "app-containers/podman, app-containers/lxc, sys-apps/bubblewrap, they are more secure and stable. "
    ewarn "This is a non-OCI tool and, you take your own risk using it when you really need. "
    ewarn "The whole project is experimental!"
}
