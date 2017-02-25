# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} pypy2_0 )

inherit distutils-r1

SRC_URI="https://github.com/ossobv/pysigset/archive/v${PV}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="Python blocking/suspending signals under Linux/OSX using ctypes sigprocmask access"
HOMEPAGE="https://github.com/ossobv/pysigset"

LICENSE="UNLICENSED"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

python_install_all() {
	local DOCS=( README.md )
	distutils-r1_python_install_all
}
