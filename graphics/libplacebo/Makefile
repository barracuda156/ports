COMMENT=	reusable library for GPU-accelerated video/image rendering

GH_ACCOUNT=	haasn
GH_PROJECT=	libplacebo
GH_TAGNAME=	v4.208.0
CATEGORIES=	graphics

SHARED_LIBS=	placebo	7.0

MAINTAINER=	Brad Smith <brad@comstyle.com>

# LGPLv2.1+
PERMIT_PACKAGE=	Yes

WANTLIB=	epoxy execinfo lcms2 m pthread

MODULES=	devel/meson

LIB_DEPENDS=	graphics/lcms2

COMPILER=	base-clang ports-gcc
COMPILER_LANGS=	c

CONFIGURE_ARGS+=-Ddefault_library=both \
		-Dd3d11=disabled \
		-Ddemos=false \
		-Dglslang=disabled \
		-Dshaderc=disabled \
		-Dunwind=disabled \
		-Dvulkan=disabled

NO_TEST=	Yes

.include <bsd.port.mk>
