COMMENT =	audio player for GNUstep

DISTNAME =	Cynthiune-1.0.0
REVISION =	16
CATEGORIES +=	audio

HOMEPAGE =	http://gap.nongnu.org/cynthiune/
SITES =		${SITE_SAVANNAH:=gap/}

SHARED_LIBS +=	Cynthiune	0.0

MODULES =	x11/gnustep
WANTLIB += 	FLAC ao ogg sndio vorbis vorbisfile z musicbrainz5
WANTLIB += 	audiofile mad modplug tag tag_c id3tag mpcdec
WANTLIB += ${COMPILER_LIBCXX}
LIB_DEPENDS +=	audio/flac \
		audio/libid3tag \
		audio/libmad \
		audio/libmodplug \
		audio/libmusicbrainz5 \
		audio/libvorbis \
		audio/musepack \
		audio/taglib \
		devel/libaudiofile

MAKE_FLAGS =	Cynthiune_INTERFACE_VERSION=${LIBCynthiune_VERSION} \
		disable-windowsmedia=yes \
		disable-alsa=yes \
		disable-esound=yes \
		disable-oss=yes

.include <bsd.port.mk>
