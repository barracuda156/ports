COMMENT =		AWS v4 authentication for py-requests

MODPY_EGG_VERSION =	1.1.1

DISTNAME =		requests-aws4auth-${MODPY_EGG_VERSION}
PKGNAME =		${MODPY_PY_PREFIX}requests-aws4auth-${MODPY_EGG_VERSION}
REVISION =		1

CATEGORIES =		security

HOMEPAGE =		https://github.com/sam-washington/requests-aws4auth

# MIT
PERMIT_PACKAGE =	Yes

MODULES =		lang/python
MODPY_PI =		Yes
MODPY_PYBUILD =	setuptools

RUN_DEPENDS =		www/py-requests${MODPY_FLAVOR}
BUILD_DEPENDS =		${RUN_DEPENDS}

FLAVORS =		python3
FLAVOR =		python3

NO_TEST =		Yes

.include <bsd.port.mk>
