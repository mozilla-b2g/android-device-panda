PRODUCT_PACKAGES := \
	librs_jni

PRODUCT_COPY_FILES := \
	device/ti/panda/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_LOCALES := en_US

PRODUCT_PROPERTY_OVERRIDES :=

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
$(call inherit-product, device/ti/panda/device.mk)

PRODUCT_NAME := panda
PRODUCT_DEVICE := panda
PRODUCT_BRAND := Android
PRODUCT_MODEL := OMAP44x0 Panda Board
