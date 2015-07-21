# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Translate Shell (formerly Google Translate CLI) is a command-line
translator powered by Google Translate."
HOMEPAGE="http://www.soimort.org/${PN}"
SRC_URI="https://github.com/soimort/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pager tts fribidi readline ssl"

DEPEND="
	>=sys-apps/gawk-4.0.0
	|| ( app-shells/bash app-shells/zsh )
	tts? (
		|| (
			media-video/mplayer
			media-video/mpv
			media-sound/mpg123
			app-accessibility/espeak
		)
	)
	fribidi? ( dev-libs/fribidi )
	pager? ( || ( sys-apps/less sys-apps/most ) )
	readline? ( app-misc/rlwrap )
	ssl? ( net-misc/curl[ssl] )
"
RDEPEND="${DEPEND}"

src_install() {
	emake PREFIX="/usr" install
	doman "man/turses.1"
}
