# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

HOMEPAGE="https://github.com/oniony/tmsu"
DESCRIPTION="TMSU lets you tags your files and then access them through a
nifty virtual filesystem from any other application."
EGIT_REPO_URI="https://github.com/oniony/${PN}.git"

SLOT="0"
LICENSE="as-is"
KEYWORDS="~amd64 ~x86"
IUSE="zsh-completion"

EGIT_CHECKOUT_DIR="${S}"
export GOPATH="${S}"

RDEPEND=">=dev-lang/go-1.5"
DEPEND="${RDEPEND}"

src_compile() {
	# Fetch dependencies.
	go get github.com/hanwen/go-fuse/fuse
	go get github.com/mattn/go-sqlite3
	# Build the package (with the fetched dependencies statically included).
	go build "${PN}"
}

src_install() {
	# Install bins.
	dobin "${PN}"
	# Install sbins.
	for $filename in misc/bin/* ; do
		dosbin "${filename}"
	done
	# Install the manual.
	doman "misc/man/${PN}.1"
	# Install ZSH completion functions.
	if use zsh-completion ; then
		insinto "/usr/share/zsh/site-functions"
		newins "misc/zsh/_${PN}" "_${PN}"
	fi
}
