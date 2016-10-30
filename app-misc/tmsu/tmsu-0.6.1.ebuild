# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build

DESCRIPTION="TMSU lets you tags your files and then access them through a
nifty virtual filesystem from any other application."
HOMEPAGE="https://github.com/oniony/TMSU"
SRC_URI="https://github.com/oniony/TMSU/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="zsh-completion"

DEPEND="
	dev-lang/go
	dev-go/go-sqlite3
	dev-libs/go-fuse
"
RDEPEND="${DEPEND}"

EGO_PN="github.com/oniony/TMSU"

src_unpack() {
	unpack ${A}
	mv "TMSU-${PV}" "${S}"
}

src_install() {
	golang-build_src_install

	# Install bins.
	newbin bin/TMSU tmsu

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
