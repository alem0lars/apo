# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="vit, a full screen terminal interface for Taskwarrior with Vi key bindings"
HOMEPAGE="http://taskwarrior.org/projects/1/wiki/Vit"

inherit eutils git-2

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=app-misc/task-2.1.2 dev-perl/Curses"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="https://git.tasktools.org/scm/ex/vit.git"
EGIT_BRANCH="1.3"
