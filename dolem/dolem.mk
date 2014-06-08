
pkgincludedir = $(includedir)/dolem
pkginclude_HEADERS = 

pkginclude_HEADERS += include/dolem/dolem.h

DISTCLEANFILES += 

pkgconfigdir = $(datadir)/pkgconfig
pkgconfig_DATA = dolem/dolem.pc

