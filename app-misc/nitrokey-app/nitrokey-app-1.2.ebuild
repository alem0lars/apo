# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Nitrokey management application"
HOMEPAGE="https://www.nitrokey.com"
SRC_URI="https://github.com/Nitrokey/nitrokey-app/archive/v${PV}-beta.3.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-libs/libusb-1.0.0
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i \
		's|usr/lib/udev/rules.d|etc/udev/rules.d|g' \
		CMakeLists.txt
	sed -i \
		's|etc/bash_completion.d|usr/share/bash-completion/completions|g' \
	CMakeLists.txt

	eapply_user
}

src_configure() {
	local mycmakeargs=(
		-DHAVE_LIBAPPINDICATOR=NO
		-DCMAKE_INSTALL_PREFIX=/
	)
	cmake-utils_src_configure
}
