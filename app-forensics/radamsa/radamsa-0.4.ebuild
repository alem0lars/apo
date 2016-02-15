# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A general purpose fuzzer"
HOMEPAGE="https://github.com/aoh/radamsa"
SRC_URI="https://github.com/aoh/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-lang/owl-lisp
"
RDEPEND=""
