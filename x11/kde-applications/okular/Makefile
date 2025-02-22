COMMENT =	KDE document viewer
DISTNAME =	okular-${VERSION}
CATEGORIES =	textproc

HOMEPAGE =	https://okular.kde.org/

SHARED_LIBS +=  Okular5Core               5.0 # 9.0

WANTLIB += ${COMPILER_LIBCXX} KF5Activities KF5Archive KF5Auth
WANTLIB += KF5AuthCore KF5Bookmarks KF5Codecs KF5Completion KF5ConfigCore
WANTLIB += KF5ConfigGui KF5ConfigWidgets KF5CoreAddons KF5Crash
WANTLIB += KF5I18n KF5IconThemes KF5ItemViews KF5JS KF5JobWidgets
WANTLIB += KF5KExiv2 KF5KHtml KF5KIOCore KF5KIOFileWidgets KF5KIOGui
WANTLIB += KF5KIOWidgets KF5Parts KF5Pty KF5Purpose KF5PurposeWidgets
WANTLIB += KF5Service KF5Solid KF5SonnetUi KF5TextWidgets KF5ThreadWeaver
WANTLIB += KF5Wallet KF5WidgetsAddons KF5WindowSystem KF5XmlGui
WANTLIB += Qt5Concurrent Qt5Core Qt5DBus Qt5Gui Qt5Network Qt5PrintSupport
WANTLIB += Qt5Qml Qt5Svg Qt5TextToSpeech Qt5Widgets Qt5X11Extras
WANTLIB += Qt5Xml X11 c chm djvulibre epub freetype jpeg m markdown
WANTLIB += phonon4qt5 poppler poppler-qt5 qmobipocket spectre
WANTLIB += tiff z zip

MODKDE5_DESKTOP_FILE = yes
MODKDE5_ICON_CACHE = yes
MODKDE5_TRANSLATIONS = yes
MODKF5_I18N_CONFLICT = yes
MODKF5_L10N_CONFLICT = yes
MODKDE5_DOCS = yes

BUILD_DEPENDS = net/libvncserver \
		devel/kf5/kirigami2

RUN_DEPENDS =	misc/shared-mime-info \
		devel/kf5/kirigami2 \
		net/libvncserver

LIB_DEPENDS =	devel/chmlib \
		devel/kf5/kactivities \
		devel/kf5/karchive \
		devel/kf5/kauth \
		devel/kf5/kbookmarks \
		devel/kf5/kcodecs \
		devel/kf5/kcompletion \
		devel/kf5/kconfig \
		devel/kf5/kconfigwidgets \
		devel/kf5/kcoreaddons \
		devel/kf5/kcrash \
		devel/kf5/khtml \
		devel/kf5/ki18n \
		devel/kf5/kiconthemes \
		devel/kf5/kio \
		devel/kf5/kitemviews \
		devel/kf5/kjobwidgets \
		devel/kf5/kjs \
		devel/kf5/kparts \
		devel/kf5/kpty \
		devel/kf5/kservice \
		devel/kf5/ktextwidgets \
		devel/kf5/kwallet \
		devel/kf5/kwidgetsaddons \
		devel/kf5/kwindowsystem \
		devel/kf5/kxmlgui \
		devel/kf5/purpose \
		devel/kf5/solid \
		devel/kf5/sonnet \
		devel/kf5/threadweaver \
		graphics/djvulibre \
		graphics/tiff \
		multimedia/phonon \
		print/poppler,-qt5>=23.05.0 \
		print/libspectre \
		textproc/discount \
		textproc/ebook-tools \
		x11/kde-applications/kdegraphics-mobipocket>=${MODKDE_VERSION} \
		x11/kde-applications/libkexiv2>=${MODKDE_VERSION} \
		x11/qt5/qtspeech \
		x11/qt5/qtsvg

CONFIGURE_ARGS +=	-DBUILD_OKULARKIRIGAMI=OFF

TEST_IS_INTERACTIVE =	X11

.include <bsd.port.mk>
