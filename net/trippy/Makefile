COMMENT=	network diagnostics with curses ui (like mtr)

DIST_TUPLE=	github fujiapple852 trippy 0.9.0 .

CATEGORIES=	net

# Apache 2.0
PERMIT_PACKAGE=	Yes

WANTLIB += ${MODCARGO_WANTLIB} m

MAINTAINER=	Stuart Henderson <stu.ports@spacehopper.org>

MODULES=	devel/cargo
CONFIGURE_STYLE= cargo

HOMEPAGE=	https://trippy.cli.rs/

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/{doc,examples}/trippy
	${INSTALL_DATA} ${WRKSRC}/trippy-config-sample.toml \
		${PREFIX}/share/examples/trippy/trippy.toml
	${INSTALL_DATA} ${WRKSRC}/README.md ${PREFIX}/share/doc/trippy

.include "crates.inc"
.include <bsd.port.mk>
