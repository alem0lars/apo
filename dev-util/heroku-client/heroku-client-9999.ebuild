# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=6

inherit eutils

MY_PN="heroku"
S="${WORKDIR}/${PN}"

DESCRIPTION="Client tools for heroku"
HOMEPAGE="http://heroku.com"
SRC_URI="http://assets.heroku.com.s3.amazonaws.com/${PN}/${PN}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/ruby"

src_install() {
	local dir="/opt/${PN}"
	local launcher="${dir}/bin/${MY_PN}"

	insinto "${dir}"

	doins -r *

	fperms 755 "${launcher}"
	make_wrapper ${MY_PN} ${launcher}
}
