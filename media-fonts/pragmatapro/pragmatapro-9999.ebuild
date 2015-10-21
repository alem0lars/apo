# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit font

DESCRIPTION="Condensed monospace font optimized for screen"
HOMEPAGE="http://www.fsd.it/fonts/pragmatapro.htm"
SRC_URI="pragmatapro.tar.gz"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="fetch"

S="${WORKDIR}/${PN}"
FONT_SUFFIX="ttf"

pkg_nofetch() {
	einfo "Please download"
	einfo "  - ${PN}.tar.gz"
	einfo "and place it in ${DISTDIR}"
}
