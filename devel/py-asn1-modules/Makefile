COMMENT =		collection of ASN.1 data structures for py-asn1

MODPY_EGG_VERSION =	0.2.8
DISTNAME =		pyasn1-modules-${MODPY_EGG_VERSION}
PKGNAME =		${DISTNAME:S/py/py-/}
CATEGORIES =		devel
REVISION =		0

HOMEPAGE =		https://github.com/etingof/pyasn1

# BSD 2-Clause
PERMIT_PACKAGE =	Yes

MODPY_PI =		Yes

MODULES =		lang/python

FLAVORS =		python3
FLAVOR =		python3

MODPY_PYBUILD =		setuptools

RUN_DEPENDS =		devel/py-asn1${MODPY_FLAVOR}

MODPY_ADJ_FILES =	tools/*.py

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/tools/* ${PREFIX}/bin/

.include <bsd.port.mk>
