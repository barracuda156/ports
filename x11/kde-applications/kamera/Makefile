COMMENT =	KDE digital camera support

DISTNAME =	kamera-${VERSION}

CATEGORIES =	x11 graphics

WANTLIB += ${COMPILER_LIBCXX} KF5Auth KF5AuthCore KF5Codecs KF5ConfigCore
WANTLIB += KF5ConfigGui KF5ConfigWidgets KF5CoreAddons KF5I18n
WANTLIB += KF5KCMUtils KF5KIOCore KF5Service KF5WidgetsAddons
WANTLIB += KF5XmlGui Qt5Concurrent Qt5Core Qt5DBus Qt5Gui Qt5Network
WANTLIB += Qt5Widgets Qt5Xml gphoto2 gphoto2_port m

MODKDE5_TRANSLATIONS = yes
MODKDE5_DESKTOP_FILE = yes
MODKF5_I18N_CONFLICT = yes
MODKF5_L10N_CONFLICT = yes

# XXX fix with new libgphoto2; revisit at next update
CXXFLAGS +=	-I${LOCALBASE}/include -DHAVE_GPHOTO2_5

BUILD_DEPENDS =	devel/kf5/kcmutils

LIB_DEPENDS =	devel/kf5/kauth \
		devel/kf5/kcodecs \
		devel/kf5/kconfig \
		devel/kf5/kconfigwidgets \
		devel/kf5/kcoreaddons \
		devel/kf5/ki18n \
		devel/kf5/kio \
		devel/kf5/kservice \
		devel/kf5/kwidgetsaddons \
		devel/kf5/kcmutils \
		devel/kf5/kxmlgui \
		graphics/libgphoto2

.include <bsd.port.mk>
