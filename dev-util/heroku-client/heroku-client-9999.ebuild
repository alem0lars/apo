# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=5

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
	insinto "${dir}"
	doins -r *
	make_wrapper ${MY_PN} ${dir}/bin/${MY_PN}
}
