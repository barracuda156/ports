COMMENT =	color contrast checker
DISTNAME =	kontrast-${VERSION}
# XXX Depends on FutureSQL
VERSION =	23.04.3
CATEGORIES =	x11 graphics

WANTLIB += ${COMPILER_LIBCXX} KF5CoreAddons KF5I18n Qt5Core Qt5DBus
WANTLIB += Qt5Gui Qt5Network Qt5Qml Qt5QmlModels Qt5Quick Qt5QuickControls2
WANTLIB += Qt5Sql Qt5Svg Qt5Widgets c m

MODKDE5_TRANSLATIONS = yes
MODKDE5_DESKTOP_FILE = yes
MODKDE5_ICON_CACHE = yes

BUILD_DEPENDS =	devel/kf5/kconfig \
		devel/kf5/kdeclarative \
		devel/kf5/kirigami2 \
		devel/kf5/kpackage \
		x11/qt5/qtquickcontrols

RUN_DEPENDS =	x11/qt5/qtquickcontrols \
		devel/kf5/kirigami2

LIB_DEPENDS =	devel/kf5/kcoreaddons \
		devel/kf5/ki18n \
		x11/qt5/qtdeclarative \
		x11/qt5/qtquickcontrols2 \
		x11/qt5/qtsvg

.include <bsd.port.mk>
