# agentx1 for LEDE/OpenWRT

## Requirement

* gcc
* git
* hg

## Build

First download [LEDE SDK](https://downloads.lede-project.org/releases/) for your device.

```bash
cd /path/to/your/sdk/package
git clone https://github.com/balthild/agentx1-lede
cd agentx1-lede
hg clone https://bitbucket.org/CrazyBoyFeng/agentx1 src
cd ..
make menuconfig
```

Then choose `agentx1` in section `Utilitiess` and save config.

Execute `make V=s` to start compilation. 

You probably would see some errors after `Signing package index...`. Ignore them. The SDK has built `.ipk` package and put them into `/path/to/your/sdk/bin/targets/your-arch/your-soc-model/packages`.

