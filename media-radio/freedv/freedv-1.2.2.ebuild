# Copyright 1999-2017 Gentoo Foundation
# Copyright 2017 Thomas Schneider <qsx@qsx.re>
# Distributed under the terms of the ISC License

EAPI=6

inherit cmake-utils wxwidgets

DESCRIPTION="FreeDV is a Digital Voice mode for HF radio."
HOMEPAGE="https://freedv.org/"
SRC_URI="https://freedv.com/wp-content/uploads/sites/8/2017/10/${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

WX_GTK_VER="3.0"

RDEPEND="
	media-libs/hamlib
	media-libs/libsamplerate
	media-libs/alsa-lib
	media-libs/libao
	media-sound/gsm
	media-libs/libsndfile
	media-libs/portaudio
	media-libs/codec2
	x11-libs/wxGTK:${WX_GTK_VER}[X]
	media-sound/sox
"
DEPEND="
	dev-util/cmake
	${RDEPEND}
"

src_configure () {
	setup-wxwidgets

	local mycmakeargs=(
		"-DUSE_STATIC_CODEC2=OFF"
		"-DUSE_STATIC_SPEEXDSP=OFF"
		"-DWXCONFIG=${WX_CONFIG}"
	)
	cmake-utils_src_configure
}
