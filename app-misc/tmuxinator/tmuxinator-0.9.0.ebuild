# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG.md CONTRIBUTING.md"

inherit ruby-fakegem

DESCRIPTION="Manage complex tmux sessions easily"
HOMEPAGE="https://github.com/tmuxinator/tmuxinator"
SRC_URI="https://github.com/tmuxinator/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/thor-0.15.0
>=dev-ruby/erubis-2.6"
