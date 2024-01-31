## Recovery Device Tree for the Moto G53 5G [XT2335-2]

# How-to compile it:

## twrp 11.0 Manifest
    repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11.0
## Sync
    repo sync
## Clone Magendanz twrp tree
    git clone https://github.com/MrFluffyOven/penang -b twrp-11.0 device/samsung/gta8wifi
## build:
    export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch twrp_gta8wifi-eng; mka bootimage
