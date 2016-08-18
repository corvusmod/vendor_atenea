# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS := vendor/hexxa/atenea/overlay

$(call inherit-product, vendor/hexxa/atenea/atenea-vendor-blobs.mk)
