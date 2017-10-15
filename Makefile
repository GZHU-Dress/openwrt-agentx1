include $(TOPDIR)/rules.mk

PKG_NAME:=agentx1
PKG_VERSION:=5
PKG_RELEASE:=1
PKG_MAINTAINER:=Richard Yu <yurichard3839@gmail.com>
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/GZHU-Dress/agentx1.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=bf02754ab47b186c6a7c390dfec5115e47c04d26
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Ruijie 802.1x auth packets relaying
	MAINTAINER:=CrazyBoyFeng
	URL:=https://bitbucket.org/CrazyBoyFeng/agentx1
	DEPENDS:=+libpthread
endef

define Package/$(PKG_NAME)/description
	Relay authentication packet for ruijie 802.1x client.
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
