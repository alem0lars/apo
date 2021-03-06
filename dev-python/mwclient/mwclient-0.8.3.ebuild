# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} python{3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Framework to MediaWiki's API."
HOMEPAGE="https://github.com/mwclient/mwclient http://sourceforge.net/projects/mwclient/"
SRC_URI="https://github.com/mwclient/mwclient/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/simplejson[${PYTHON_USEDEP}]
	dev-python/requests-oauthlib
"
DEPEND="${RDEPEND}"

DOCS=( README.rst {REFERENCE,CHANGELOG}.md )

python_prepare_all() {
	sed -i \
		-e "/use_setuptools/d" \
		setup.py || die
}
