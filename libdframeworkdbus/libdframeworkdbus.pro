TEMPLATE = lib
TARGET = dframeworkdbus
VERSION = 1.0
CONFIG += c++11 create_pc create_prl no_install_prl

include(qtdbusextended/qtdbusextended.pri)

HEADERS += \
    types/zoneinfo.h \
    types/audioport.h \
    types/audioportlist.h \
    types/batterypercentageinfo.h \
    types/batterypresentinfo.h \
    types/batterystateinfo.h \
    types/brightnessmap.h \
    types/screenrect.h \
    types/inputdevicelist.h \
    types/keyboardlayoutlist.h \
    types/localelist.h \
    types/arealist.h \
    types/qvariantlist.h \
    types/wacomdevicelist.h \
    types/searchmap.h \
    types/resolutionlist.h \
    types/resolution.h \
    types/rotationlist.h \
    types/reflectlist.h \
    types/appupdateinfo.h \
    types/mirrorinfo.h

SOURCES += \ 
    types/zoneinfo.cpp \
    types/screenrect.cpp \
    types/inputdevicelist.cpp \
    types/localelist.cpp \
    types/audioport.cpp \
    types/audioportlist.cpp \
    types/keyboardlayoutlist.cpp \
    types/arealist.cpp \
    types/qvariantlist.cpp \
    types/brightnessmap.cpp \
    types/batterypresentinfo.cpp \
    types/batterystateinfo.cpp \
    types/batterypercentageinfo.cpp \
    types/wacomdevicelist.cpp \
    types/searchmap.cpp \
    types/resolutionlist.cpp \
    types/resolution.cpp \
    types/rotationlist.cpp \
    types/reflectlist.cpp \
    types/appupdateinfo.cpp \
    types/mirrorinfo.cpp

system(python2 $$PWD/generate_code.py)
include(generated/generated.pri)

isEmpty(LIB_INSTALL_DIR) {
    target.path = /usr/lib
} else {
    target.path = $$LIB_INSTALL_DIR
}

includes.files =
includes.path = /usr/include/libdframeworkdbus-$$VERSION

type_headers.files =
type_headers.path = $$includes.path/types

for(header, HEADERS) {
    TMP = $${dirname(header)}
    DIRNAME = $${basename(TMP)}

    equals(DIRNAME, types) {
        eval(type_headers.files += $$header)
    } else {
        eval(includes.files += $$header)
    }
}

QMAKE_PKGCONFIG_NAME = libdframeworkdbus
QMAKE_PKGCONFIG_VERSION = $$VERSION
QMAKE_PKGCONFIG_DESCRIPTION = libdframeworkdbus
QMAKE_PKGCONFIG_INCDIR = $$includes.path
QMAKE_PKGCONFIG_LIBDIR = $$target.path
QMAKE_PKGCONFIG_DESTDIR = pkgconfig

INSTALLS += includes type_headers target
