
DEVICE_PACKAGE_OVERLAYS := 

PRODUCT_COPY_FILES := \
	device/ti/panda/init.board.rc:root/init.omap4.rc
# TODO: in HC change to init.omap4pandaboard.rc

PRODUCT_PACKAGES := 

PRODUCT_PROPERTY_OVERRIDES :=

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

