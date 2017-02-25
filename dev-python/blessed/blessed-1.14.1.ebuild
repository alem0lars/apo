# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="Wrapper around terminal styling, screen positioning, and keyboard input"
HOMEPAGE="https://github.com/jquast/blessed https://pypi.python.org/pypi/blessed/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DEPEND="test? ( dev-python/nose[${PYTHON_USEDEP}] )"

python_test() {
	# The tests need an interactive terminal
	# https://github.com/erikrose/blessings/issues/117
	script -eqc "nosetests -w \"${BUILD_DIR}\"" /dev/null \
		|| die "tests failed with ${EPYTHON}"
}
