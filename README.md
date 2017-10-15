# agentx1 for LEDE/OpenWRT

## Build

First download [LEDE SDK](https://downloads.lede-project.org/releases/) for your device.

```sh
cd /path/to/your/sdk
git clone https://github.com/GZHU-Dress/openwrt-agentx1.git package/agentx1
make menuconfig # choose `agentx1` in section `Utilities`
make package/agentx1/compile V=s
```
