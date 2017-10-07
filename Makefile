include $(TOPDIR)/rules.mk


PKG_NAME := agentx1
PKG_VERSION := 4
PKG_RELEASE := 1

PKG_BUILD_DIR:= $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION := utils
	CATEGORY := Utilities
	TITLE := Ruijie 802.1x auth packets relaying
	MAINTAINER := CrazyBoyFeng
	URL := https://bitbucket.org/CrazyBoyFeng/agentx1
	DEPENDS:=+libpthread
endef

define Package/$(PKG_NAME)/description
	Relay authentication packet for ruijie 802.1x client.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/agentx1 $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/agentx1.args $(1)/etc/agentx1.args
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/agentx1.init $(1)/etc/init.d/agentx1
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
