COMMENT=	Python interface to Graphviz's Dot#'

MODPY_EGG_VERSION= 1.4.2
DISTNAME=	pydot-${MODPY_EGG_VERSION}
PKGNAME=	${DISTNAME:S/py/py-/}
CATEGORIES=	graphics
REVISION=	2

HOMEPAGE=	https://github.com/erocarrera/pydot

# MIT
PERMIT_PACKAGE=	Yes

FLAVORS=	python3
FLAVOR=		python3

MODULES=	lang/python

MODPY_PI=	Yes
MODPY_PYBUILD=	setuptools

BUILD_DEPENDS=	devel/py-parsing${MODPY_FLAVOR}
RUN_DEPENDS=	devel/py-parsing${MODPY_FLAVOR} \
		math/graphviz

TEST_DEPENDS=	${FULLPKGNAME}:${BUILD_PKGPATH} \
		devel/py-hypothesis${MODPY_FLAVOR} \
		textproc/py-chardet${MODPY_FLAVOR}

do-test:
	cd ${WRKSRC}/test; ${MODPY_BIN} pydot_unittest.py

.include <bsd.port.mk>
