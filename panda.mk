PRODUCT_PACKAGES :=

PRODUCT_COPY_FILES :=

PRODUCT_LOCALES := en_US

PRODUCT_PROPERTY_OVERRIDES :=

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/ti/panda/device.mk)

PRODUCT_NAME := panda
PRODUCT_DEVICE := panda
PRODUCT_BRAND := Android
PRODUCT_MODEL := OMAP44x0 Panda Board
