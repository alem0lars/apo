# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} pypy2_0 )

inherit distutils-r1 git-r3

EGIT_REPO_URI="git://github.com/snarez/${PN}.git"

DESCRIPTION="A half-arsed UI module for GDB & LLDB"
HOMEPAGE="https://github.com/snare/voltron"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/flask
	dev-python/flask-restful
	dev-python/pygments
	dev-python/requests
	dev-python/six
	dev-python/requests-unixsocket
	dev-python/blessed
	dev-python/pysigset
	>=dev-python/scruffy-0.3.6
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/setup.patch )

python_install_all() {
	local DOCS=( README.md )
	distutils-r1_python_install_all
}
