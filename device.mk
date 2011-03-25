
DEVICE_PACKAGE_OVERLAYS := device/ti/panda/overlay

PRODUCT_COPY_FILES := \
	device/ti/panda/init.omap4pandaboard.rc:root/init.omap4pandaboard.rc

PRODUCT_PACKAGES := 

PRODUCT_PROPERTY_OVERRIDES := \
	dalvik.vm.heapsize=48m \
	hwui.render_dirty_regions=false

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

