# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

DESCRIPTION="A fullscreen terminal UI for Taskwarrior with Vi keybindings"
HOMEPAGE="http://tasktools.org/projects/vit.html"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=app-misc/task-2.1.2 dev-perl/Curses"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="https://git.tasktools.org/scm/ex/vit.git"
EGIT_BRANCH="1.3"
