COMMENT =		capture c-level output in context managers

MODPY_EGG_VERSION =	2.0.1
DISTNAME =		wurlitzer-${MODPY_EGG_VERSION}
PKGNAME =		py-${DISTNAME}
REVISION =		3

CATEGORIES =		devel

HOMEPAGE =		https://github.com/minrk/wurlitzer

# MIT
PERMIT_PACKAGE =	Yes

MODULES =		lang/python

MODPY_PI =		Yes
MODPY_PYBUILD =		setuptools
MODPY_PYTEST_ARGS =	test.py

FLAVORS =		python3
FLAVOR =		python3

TEST_DEPENDS =		devel/py-mock${MODPY_FLAVOR}

pre-configure:
	cd ${WRKDIR}; ${CC} ${CFLAGS} ${FILESDIR}/getsize.c -o getsize; \
	sed -i "s,SIZE_OF_FILE,$$(./getsize),g" ${WRKSRC}/wurlitzer.py

.include <bsd.port.mk>
