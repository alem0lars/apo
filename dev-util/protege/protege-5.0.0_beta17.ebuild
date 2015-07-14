# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=5
inherit eutils

_PV=$(echo "${PV}" | sed s/\_/-/g | sed s/beta/beta-/g)
S="${WORKDIR}/Protege-${_PV}"

DESCRIPTION="A free, open-source ontology editor and framework for building intelligent systems"
HOMEPAGE="http://protege.stanford.edu/"
SRC_URI="https://github.com/protegeproject/${PN}/releases/download/${PN}-parent-${_PV}/${PN}-${_PV}-platform-independent.zip"
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
