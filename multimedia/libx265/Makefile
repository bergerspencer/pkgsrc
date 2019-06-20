# $NetBSD: Makefile,v 1.25 2019/01/25 09:01:13 adam Exp $

DISTNAME=	x265_3.0
PKGNAME=	lib${DISTNAME:S/_/-/}
CATEGORIES=	multimedia
MASTER_SITES=	https://bitbucket.org/multicoreware/x265/downloads/
MASTER_SITES+=	http://download.videolan.org/videolan/x265/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.x265.org/
COMMENT=	High Efficiency Video Coding (HEVC)
LICENSE=	gnu-gpl-v2

WRKSRC=		${WRKDIR}/${DISTNAME}/source
.if ${MACHINE_ARCH} == "x86_64" || ${MACHINE_ARCH} == "i386"
BUILD_DEPENDS+=	nasm>=2.13.0:../../devel/nasm
.endif

USE_CMAKE=		yes
USE_LANGUAGES=		c c++
CMAKE_ARG_PATH=		../
CMAKE_ARGS+= -DENABLE_CLI=OFF
PATCHDIR=${.CURDIR}/../../multimedia/x265/patches
BUILD_DIRS=${LIB_TARGETS}
PLIST_SRC=${LIB_TARGETS:@t@PLIST_${t}@}
AUTO_MKDIRS=yes

.PHONY: configure-main configure-main10 configure-main12
configure-main:
	${RUN}${_ULIMIT_CMD}	\
	cd ${WRKSRC} && mkdir -p main && cd main && \
	${PKGSRC_SETENV} ${_CONFIGURE_CMAKE_ENV}\
	cmake ${CMAKE_ARGS} ${CMAKE_ARG_PATH}
configure-main10:
	${RUN}${_ULIMIT_CMD}	\
	cd ${WRKSRC} && mkdir -p main10 && cd main10 && \
	${PKGSRC_SETENV} ${_CONFIGURE_CMAKE_ENV}\
	cmake ${CMAKE_ARGS} -DHIGH_BIT_DEPTH=ON ${CMAKE_ARG_PATH}
configure-main12:
	${RUN}${_ULIMIT_CMD}	\
	cd ${WRKSRC} && mkdir -p main12 && cd main12 && \
	${PKGSRC_SETENV} ${_CONFIGURE_CMAKE_ENV}\
	cmake ${CMAKE_ARGS} -DHIGH_BIT_DEPTH=ON -DMAIN12=ON ${CMAKE_ARG_PATH}

.include "options.mk"
do-configure: ${LIB_TARGETS:@target@configure-${target}@}
do-install:
.  for target in ${LIB_TARGETS}
	${INSTALL_LIB} ${WRKSRC}/${target}/libx265.so.169 ${DESTDIR}${PREFIX}/lib/libx265_${target}.so.169
	${LN} -s libx265_${target}.so.169 ${DESTDIR}${PREFIX}/lib/libx265_${target}.so
.  endfor

.include "../../mk/bsd.pkg.mk"
