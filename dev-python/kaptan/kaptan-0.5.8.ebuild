# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{3,4}} )

inherit distutils-r1

DESCRIPTION="Configuration manager in your pocket."
HOMEPAGE="https://github.com/emre/kaptan"
SRC_URI="https://github.com/emre/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	>=app-misc/tmux-1.8
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	test? ( >=dev-python/pytest-2.3.5[${PYTHON_USEDEP}] )
"

python_test() {
	py.test tests.py || die "Tests fail with ${EPYTHON}"
}
