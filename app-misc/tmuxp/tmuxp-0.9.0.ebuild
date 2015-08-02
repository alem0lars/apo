# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_{3,4}} )

inherit distutils-r1

DESCRIPTION="tmux session manager in python"
HOMEPAGE="https://github.com/tony/tmuxp"
SRC_URI="https://github.com/tony/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test examples zsh-completion"

DEPEND="
	>=app-misc/tmux-1.8
	>=dev-python/kaptan-0.5.7[${PYTHON_USEDEP}]
	dev-python/argcomplete[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	test? ( dev-python/coverage[${PYTHON_USEDEP}] )
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx-argparse[${PYTHON_USEDEP}]
	)
"

python_compile_all() {
	use doc && emake -C doc html
	emake -C doc man
}

python_test() {
	coverage run --source=${PN} setup.py test || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	doman "doc/_build/man/${PN}.1"
	use doc && local HTML_DOCS=( doc/_build/html/. )

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins -r examples/*
	fi

    newbashcomp pkg/${PN}.bash "${PN}"

    if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins pkg/${PN}.zsh _${PN}
    fi

	distutils-r1_python_install_all
}
