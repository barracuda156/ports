COMMENT=	add support for i18n, documentation and icons to distutils

MODPY_EGG_VERSION=	2.39
DISTNAME=	python-distutils-extra-${MODPY_EGG_VERSION}
PKGNAME=	py-distutils-extra-${MODPY_EGG_VERSION}
REVISION=	0

CATEGORIES=	devel

HOMEPAGE=	https://launchpad.net/python-distutils-extra/

# GPLv2
PERMIT_PACKAGE=	Yes

SITES=		https://launchpad.net/python-distutils-extra/trunk/${MODPY_EGG_VERSION}/+download/

MODULES=	lang/python
MODPY_PYBUILD=	setuptools

# DistUtilsExtra/command/build_i18n.py
RUN_DEPENDS=	textproc/intltool

FLAVORS=	python3
FLAVOR=		python3

.include <bsd.port.mk>
