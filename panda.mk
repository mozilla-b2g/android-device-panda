ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
endif

PRODUCT_PACKAGES := \
	librs_jni

PRODUCT_COPY_FILES := \
	$(TARGET_PREBUILT_KERNEL):kernel \
	device/ti/panda/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_LOCALES := en_US

PRODUCT_PROPERTY_OVERRIDES :=

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
$(call inherit-product, device/ti/panda/device.mk)
$(call inherit-product-if-exists, vendor/ti/proprietary/omap4/ti-omap4-vendor.mk)

PRODUCT_NAME := panda
PRODUCT_DEVICE := panda
PRODUCT_BRAND := Android
PRODUCT_MODEL := OMAP44x0 Panda Board
