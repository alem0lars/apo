# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_{3,4}} )

inherit distutils-r1

DESCRIPTION="Sphinx extension that automatically document argparse commands and
options."
HOMEPAGE="https://github.com/ribozz/sphinx-argparse"
SRC_URI="https://github.com/ribozz/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="
	dev-python/sphinx[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	doc? (
		dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
	)
"

python_compile_all() {
	use doc && emake -C docs html
	emake -C docs man
}

python_test() {
	py.test || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	doman "docs/_build/man/${PN}.1"
	use doc && local HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}
