# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils java-pkg-2 fdo-mime

MY_PN="${PN/-bin/}"
MY_PN_CAPS="${MY_PN/jd/JD}"
src_jar="${MY_PN_CAPS}.jar"
dst_jar="${MY_PN}.jar"
src_icon="themes/standard/org/${MY_PN}/images/updaterIcon100.png"
dst_icon="${MY_PN}-icon.png"

DESCRIPTION="${MY_PN_CAPS} is a Java download tool."
HOMEPAGE="http://www.${MY_PN}.org"
SRC_URI="http://installer.${MY_PN}.org/${src_jar}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jre-1.6:*"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	# Copy the downloaded jar.
	cp -v "${DISTDIR}/${A}" . || die
	# Extract the image from the jar. It will be used later as icon.
	jar xf ${src_jar} ${src_icon} || die
}

src_install() {
	java-pkg_newjar ${src_jar} ${dst_jar}
	java-pkg_dolauncher ${MY_PN} --jar ${dst_jar}
	newicon ${src_icon} ${dst_icon}
	make_desktop_entry ${MY_PN} ${MY_PN_CAPS} ${dst_icon}
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
