COMMENT=	Python code formatter

MODPY_EGG_VERSION=	23.11.0
DISTNAME=	black-${MODPY_EGG_VERSION}
PKGNAME=	py-black-${MODPY_EGG_VERSION:S/b/beta/}
REVISION=	0

CATEGORIES=	textproc devel

# https://github.com/ambv/black
HOMEPAGE=	https://black.readthedocs.io/

MAINTAINER=	Daniel Dickman <daniel@openbsd.org>

# MIT
PERMIT_PACKAGE=	Yes

MODULES=	lang/python
MODPY_PI=	Yes
MODPY_PYBUILD=	hatch-vcs

# compiled version can optionally be built, but requires additional deps in
# fairly specific versions: hatch-mypyc>=0.16.0, mypy==1.5.1, click==8.1.3
BUILD_DEPENDS=	devel/py-hatch-fancy-pypi-readme${MODPY_FLAVOR}

RUN_DEPENDS=	devel/py-click${MODPY_FLAVOR}>=8.0.0 \
		devel/py-mypy-extensions${MODPY_FLAVOR}>=0.4.3 \
		sysutils/py-packaging${MODPY_FLAVOR}>=22.0 \
		devel/py-pathspec${MODPY_FLAVOR}>=0.9.0 \
		sysutils/py-platformdirs${MODPY_FLAVOR}>=2
# until py3.11
RUN_DEPENDS+=	textproc/py-tomli${MODPY_FLAVOR}>=1.1.0 \
		devel/py-typing-extensions${MODPY_FLAVOR}>=4.0.1

FLAVORS=	python3
FLAVOR=		python3

.include <bsd.port.mk>
