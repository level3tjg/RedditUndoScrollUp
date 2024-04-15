TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = Reddit RedditApp


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RedditUndoScrollUp

RedditUndoScrollUp_FILES = Tweak.xm
RedditUndoScrollUp_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
