# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MY_PN="Buku"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="Powerful command-line bookmark manager. Your mini web!"
HOMEPAGE="https://github.com/jarun/${MY_PN}"
SRC_URI="https://github.com/jarun/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bash-completion zsh-completion"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_install() {
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
