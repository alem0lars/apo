# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

SRC_URI="https://github.com/msabramo/requests-unixsocket/archive/${PV}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="A half-arsed UI module for GDB & LLDB"
HOMEPAGE="https://github.com/msabramo/requests-unixsocket"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/requests-1.1
	>=dev-python/urllib3-1.8
"
RDEPEND="${DEPEND}"

python_install_all() {
	local DOCS=( README.md )
	distutils-r1_python_install_all
}
