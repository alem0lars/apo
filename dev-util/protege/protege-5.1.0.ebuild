# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=6
inherit eutils

MY_PV=${PV/_beta/-beta-}
S="${WORKDIR}/${PN}-${MY_PV}"

DESCRIPTION="A free, open-source ontology editor and framework for building intelligent systems"
HOMEPAGE="http://protege.stanford.edu/"
SRC_URI="https://github.com/protegeproject/${PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"
IUSE=""
KEYWORDS="~amd64 ~x86"

SLOT="0"

DEPEND=">=virtual/jdk-1.7"
RDEPEND="${DEPEND}"


src_install() {
	local dir="/opt/${PN}"
	local launcher="${dir}/run.sh"

	# Copy extracted files into `${dir}`.
	insinto "${dir}"
	doins -r *

	# Make the launcher (file `run.sh`) executable.
	fperms 755 "${launcher}"

	make_wrapper ${PN} "${launcher}"
}
