# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit toolchain-funcs python-single-r1

DESCRIPTION="A tool that can give numerous reports on memory usage on Linux systems"
HOMEPAGE="http://www.selenic.com/smem/"
SRC_URI="https://selenic.com/repo/smem/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="graph"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="!dev-util/smem
	${PYTHON_DEPS}
	graph? ( dev-python/matplotlib[${PYTHON_USEDEP}] )"

src_compile() {
	emake CC="$(tc-getCC)" smemcap
}

src_install() {
	python_doscript ${PN}
	dobin smemcap
	doman smem.8
}
