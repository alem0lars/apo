# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit bash-completion-r1 eutils distutils-r1 git-2

DESCRIPTION="Console client for Evernote"
HOMEPAGE="http://geeknote.me"

EGIT_REPO_URI="git://github.com/VitaliyRodnenko/geeknote.git"
EGIT_BRANCH="master"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+bash-completion"

DEPEND="
	bash-completion? ( app-shells/bash-completion )
	dev-python/html2text
	dev-python/sqlalchemy
	dev-python/markdown2
	dev-python/beautifulsoup:4
	dev-python/evernote-sdk-python
"
RDEPEND="${DEPEND}"

src_install() {
	if use bash-completion; then
		insinto /etc/bash_completion.d/
		newins ${FILESDIR}/completion.bash geeknote
	fi

	distutils-r1_src_install
}
