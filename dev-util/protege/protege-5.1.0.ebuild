# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=6
inherit eutils

MY_PN="Protege"
MY_PV=${PV/_beta/-beta-}
MY_P="${MY_PN}-${MY_PV}"

S="${WORKDIR}/${MY_P}"

DESCRIPTION="A free, open-source ontology editor and framework for building intelligent systems"
HOMEPAGE="http://protege.stanford.edu/"
SRC_URI="https://github.com/protegeproject/${PN}-distribution/releases/download/v${PV}/${MY_P}-linux.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"
IUSE=""
KEYWORDS="~amd64 ~x86"

SLOT="0"

DEPEND=">=virtual/jdk-1.7"
RDEPEND="${DEPEND}"


src_install() {
	local dir="/opt/${PN}"
	local jre_bins="${dir}/jre/bin"
	local launcher="${dir}/run.sh"

	# Copy extracted files into `${dir}`.
	insinto "${dir}"
	doins -r *

	# Make the launcher (file `run.sh`) executable.
	fperms 755 "${launcher}"
	for f in `ls ${jre_bins}/*`; do
		echo $f
		fperms 755 "${f}"
	done

	make_wrapper ${PN} "${launcher}"
}
