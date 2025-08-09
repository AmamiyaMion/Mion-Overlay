EAPI=8
inherit autotools
DESCRIPTION="Linux container, with zero runtime dependency (Lightweight User-friendly Linux-container Implementation)"
HOMEPAGE="https://github.com/RuriOSS/ruri"
if [[ ${PV} == 9999* ]]; then 
    inherit git-r3
	EGIT_REPO_URI="https://github.com/RuriOSS/ruri.git"
else
    SRC_URI="https://github.com/RuriOSS/ruri/archive/refs/tags/v${PV}.tar.gz"
    KEYWORDS="~amd64 ~aarch64"
fi
LICENSE="MIT"
SLOT="0"

IUSE="coreonly +libcap +libseccomp +rurienv static debug dev"

RDEPEND="libcap? ( sys-libs/libcap )
         libseccomp? ( sys-libs/libseccomp )
         static? ( sys-libs/libcap[static-libs] sys-libs/libseccomp[static-libs] )"

DEPEND="${RDEPEND}"
BDEPEND="dev-build/autoconf"

src_prepare() {
	default
	eaclocal
	eautoconf
}

src_configure() {
	local conf=( ./configure )
	use coreonly && conf+=( --enable-coreonly )
	use libcap || conf+=( --disable-libcap )
	use libseccomp || conf+=( --disable-libseccomp )
	use rurienv || conf+=( --disable-rurienv )
	use static && conf+=( --enable-static )
	use debug && conf+=( --enable-debug )
	use dev && conf+=( --enable-dev )
	"${conf[@]}" || die
}

src_install() {
    dobin ruri
    ewarn "From the ruri developers: "
    ewarn "For production, I fully recommand you to use tools like app-containers/crun, "
    ewarn "youki (currently not packaged in any overlay), app-containers/containerd, app-containers/docker, "
    ewarn "app-containers/podman, app-containers/lxc, sys-apps/bubblewrap, they are more secure and stable. "
    ewarn "This is a non-OCI tool and, you take your own risk using it when you really need. "
    ewarn "The whole project is experimental!"
}
