# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{3,4} )
DISTUTILS_SINGLE_IMPL=yes

inherit distutils-r1

MY_PN="${PN}.py"
DESCRIPTION="A full-featured Python wrapper (and command-line utility) for the Pinboard API."
HOMEPAGE="https://github.com/lionheart/${MY_PN}"
SRC_URI="https://github.com/lionheart/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all

	dobin "bin/pinboard"
}
