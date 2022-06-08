ARCHS = armv7 arm64
TARGET = iphone:clang:10.3.4:8.0
PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
SYSROOT = $(THEOS)/sdks/iPhoneOS10.3.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Springlicious

Springlicious_FILES = Tweak.xm
Springlicious_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += springliciousprefs
include $(THEOS_MAKE_PATH)/aggregate.mk