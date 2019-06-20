# $NetBSD: options.mk,v 1.2 2018/10/06 15:41:56 wiz Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.libx265
PKG_SUPPORTED_OPTIONS= x265-main x265-main10 x265-main12
PKG_SUGGESTED_OPTIONS= x265-main10 x265-main12

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mx265-main)
LIB_TARGETS+= main
.endif
.if !empty(PKG_OPTIONS:Mx265-main10)
LIB_TARGETS+= main10
.endif
.if !empty(PKG_OPTIONS:Mx265-main12)
LIB_TARGETS+= main12
.endif
