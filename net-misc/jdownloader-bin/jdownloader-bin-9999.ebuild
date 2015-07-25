# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils java-pkg-2 fdo-mime

MY_PN=${PN/-bin/}
MY_PN=${MY_PN/jd/JD}

DESCRIPTION="JDownloader is a Java download tool."
HOMEPAGE="http://www.jdownloader.org/"
SRC_URI="http://installer.jdownloader.org/JDownloader.jar"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jre-1.6:*"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

icon_path="themes/standard/JDownloader/org/jdownloader/images/updaterIcon100.png"
jar_path=${MY_PN}.jar

src_unpack() {
	cp -v "${DISTDIR}/${A}" . || die
	jar xf ${jar_path} ${icon_path} || die
}

src_install() {
	java-pkg_newjar ${jar_path}
	java-pkg_dolauncher ${PN} --jar ${jar_path}
	newicon ${icon_path} ${MY_PN}.png
	make_desktop_entry ${PN} ${MY_PN} ${MY_PN}
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
