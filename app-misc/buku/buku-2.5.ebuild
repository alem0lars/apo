# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4} )
DISTUTILS_SINGLE_IMPL=yes

inherit distutils-r1

MY_PN="Buku"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="Powerful command-line bookmark manager. Your mini web!"
HOMEPAGE="https://github.com/jarun/${MY_PN}"
SRC_URI="https://github.com/jarun/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

python_install_all() {
	distutils-r1_python_install_all

	if use bash-completion; then
		insinto /etc/bash_completion.d/
		doins auto-completion/bash/buku-completion.bash
	fi

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions/
		doins auto-completion/zsh/_buku
	fi

	dobin "buku"

	doman "buku.1"
}
