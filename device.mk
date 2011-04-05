
DEVICE_PACKAGE_OVERLAYS := device/ti/panda/overlay

PRODUCT_COPY_FILES := \
	device/ti/panda/init.omap4pandaboard.rc:root/init.omap4pandaboard.rc \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_PACKAGES := \
	com.android.future.usb.accessory

PRODUCT_PROPERTY_OVERRIDES := \
	hwui.render_dirty_regions=false

include frameworks/base/build/tablet-dalvik-heap.mk

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

