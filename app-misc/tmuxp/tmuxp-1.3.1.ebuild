# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} )
DISTUTILS_SINGLE_IMPL=yes

inherit distutils-r1

DESCRIPTION="tmux session manager in python"
HOMEPAGE="https://github.com/tony/tmuxp"
SRC_URI="https://github.com/tony/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test" # doc examples

DEPEND="
	>=app-misc/tmux-1.8
	=dev-python/libtmux-0.7.3[${PYTHON_USEDEP}]
	=dev-python/kaptan-0.5.7[${PYTHON_USEDEP}]
	=dev-python/click-6.7[${PYTHON_USEDEP}]
	dev-python/argcomplete[${PYTHON_USEDEP}]
	=dev-python/colorama-0.3.9[${PYTHON_USEDEP}]
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
"
#	doc? (
#		dev-python/sphinx[${PYTHON_USEDEP}]
#		dev-python/sphinx-argparse[${PYTHON_USEDEP}]
#		dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
#		=dev-python/docutils-0.12[${PYTHON_USEDEP}]
#		dev-python/reportlab[${PYTHON_USEDEP}]
#	)
RDEPEND="${DEPEND}"

#python_prepare_all() {
#	epatch "${FILESDIR}/aafig-py3.patch"
#	find doc/_ext -name 'aafig.py' -type f -exec sed -i.orig 's/\t/        /g' {} +
#}

#python_compile_all() {
#	use doc && emake -C doc html
#	emake -C doc man
#}

python_test() {
	coverage run --source=${PN} setup.py test || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
#	doman "doc/_build/man/${PN}.1"
#	use doc && local HTML_DOCS=( doc/_build/html/. )
#
#	if use examples; then
#		insinto /usr/share/doc/${PF}/examples
#		doins -r examples/*
#	fi
	distutils-r1_python_install_all
}
