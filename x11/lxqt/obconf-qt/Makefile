COMMENT =	configuration editor for openbox window manager

VERSION =	0.16.1
REVISION =	0

NAME =		obconf-qt

WANTLIB += ${COMPILER_LIBCXX} ICE Imlib2 Qt5Core Qt5Gui Qt5Widgets
WANTLIB += Qt5X11Extras SM X11 Xft c cairo fontconfig freetype
WANTLIB += gdk_pixbuf-2.0 gio-2.0 glib-2.0 gobject-2.0 harfbuzz
WANTLIB += intl m obrender obt pango-1.0 pangoft2-1.0 pangoxft-1.0
WANTLIB += rsvg-2 xml2 z

LIB_DEPENDS +=		x11/qt5/qtx11extras \
			x11/openbox

BUILD_DEPENDS +=	x11/lxqt/build-tools

RUN_DEPENDS +=		devel/desktop-file-utils \
			x11/gtk+4,-guic

.include <bsd.port.mk>
