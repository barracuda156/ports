COMMENT =	python client for consul

MODPY_EGG_VERSION =	1.1.0

DISTNAME =	python-consul-${MODPY_EGG_VERSION}
PKGNAME =	py-consul-${MODPY_EGG_VERSION}
REVISION =	3

CATEGORIES =	sysutils

HOMEPAGE =	https://python-consul.readthedocs.io

# MIT
PERMIT_PACKAGE =	Yes

MODULES =	lang/python
FLAVOR =	python3
FLAVORS =	python3

MODPY_PI =		Yes
MODPY_PYBUILD =		setuptools

RUN_DEPENDS =	www/py-requests${MODPY_FLAVOR} \
		devel/py-six${MODPY_FLAVOR}

# requires pytest-twisted
NO_TEST =	Yes

.include <bsd.port.mk>
