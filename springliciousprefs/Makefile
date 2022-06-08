ARCHS = armv7 arm64
TARGET = iphone:clang:10.3.4:8.0
PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
SYSROOT = $(THEOS)/sdks/iPhoneOS10.3.sdk
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SpringliciousPrefs

SpringliciousPrefs_FILES = ZLPRootListController.m
SpringliciousPrefs_FRAMEWORKS = UIKit
SpringliciousPrefs_PRIVATE_FRAMEWORKS = Preferences
SpringliciousPrefs_INSTALL_PATH = /Library/PreferenceBundles
SpringliciousPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
