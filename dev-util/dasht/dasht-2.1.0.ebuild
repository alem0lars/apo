# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Search API docs offline, in terminal or browser."
HOMEPAGE="https://github.com/sunaku/dasht"
SRC_URI="https://github.com/sunaku/dasht/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="zsh-completion"

DEPEND="
	dev-db/sqlite:3
	net-misc/wget
	virtual/w3m
	net-misc/socat
"
RDEPEND="${DEPEND}"

src_install() {
	# Install bins.
	dobin bin/*

	# Install the manual.
	doman "man/man1/${PN}.1"

	# Install ZSH completion functions.
	if use zsh-completion; then
		insinto "/usr/share/zsh/site-functions"
		doins etc/zsh/completions/*
	fi
}
