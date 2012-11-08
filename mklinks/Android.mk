
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE                  := mklinks
LOCAL_MODULE_TAGS             := optional eng
LOCAL_MODULE_PATH             := $(TARGET_ROOT_OUT_SBIN)
LOCAL_UNSTRIPPED_PATH         := $(TARGET_ROOT_OUT_SBIN_UNSTRIPPED)
LOCAL_SRC_FILES               := mklinks.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_STATIC_LIBRARIES        := libcutils libc

include $(BUILD_EXECUTABLE)
