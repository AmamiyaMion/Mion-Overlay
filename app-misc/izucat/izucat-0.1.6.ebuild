# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.3
	anstream@0.6.19
	anstyle-parse@0.2.7
	anstyle-query@1.1.3
	anstyle-wincon@3.0.9
	anstyle@1.0.11
	atty@0.2.14
	bstr@1.12.0
	bumpalo@3.18.1
	cfg-if@1.0.1
	clap@4.5.40
	clap_builder@4.5.40
	clap_derive@4.5.40
	clap_lex@0.7.5
	colorchoice@1.0.4
	console@0.15.11
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	encode_unicode@1.0.0
	globset@0.4.16
	heck@0.5.0
	hermit-abi@0.1.19
	ignore@0.4.23
	indicatif@0.17.11
	is_terminal_polyfill@1.70.1
	js-sys@0.3.77
	libc@0.2.174
	log@0.4.27
	memchr@2.7.5
	number_prefix@0.4.0
	once_cell@1.21.3
	once_cell_polyfill@1.70.1
	portable-atomic@1.11.1
	proc-macro2@1.0.95
	quote@1.0.40
	regex-automata@0.4.9
	regex-syntax@0.8.5
	same-file@1.0.6
	serde@1.0.219
	serde_derive@1.0.219
	strsim@0.11.1
	syn@2.0.104
	unicode-ident@1.0.18
	unicode-width@0.2.1
	utf8parse@0.2.2
	walkdir@2.5.0
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	web-time@1.1.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
"

inherit cargo

DESCRIPTION="A program that can recursively concatenate (cat) text and binary files in a path and/or command/stdin output to typst. "
HOMEPAGE="https://github.com/Souiken/izucat"
SRC_URI="
    https://github.com/Souiken/izucat/archive/v${PV}/${PN}-v${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"
