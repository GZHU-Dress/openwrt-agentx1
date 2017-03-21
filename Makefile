include $(TOPDIR)/rules.mk

PKG_NAME := agentx1
PKG_VERSION := 4
PKG_RELEASE := 1

PKG_BUILD_DIR:= $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
    SECTION := utils
    CATEGORY := Utilities
    TITLE := agentx1 -- 壹代理
    MAINTAINER := CrazyBoyFeng
endef

define Package/$(PKG_NAME)/description
    Relay authentication packet for ruijie 802.1x client.
endef

define Build/Prepare
    mkdir -p $(PKG_BUILD_DIR)
    $(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/eep/install
    $(INSTALL_DIR) $(1)/bin
    $(INSTALL_BIN) $(PKG_BUILD_DIR)/agentx1 $(1)/bin/
endef

$(eval $(call BuildPackage,agentx1))
