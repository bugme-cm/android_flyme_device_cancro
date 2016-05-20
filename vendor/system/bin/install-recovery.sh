#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 13588480 cf1b2200ce952e669e83c8c8b5d49d510f9d3ed8 10840064 767e046a013f0da1c618084ffa254abbdfdcc051
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:13588480:cf1b2200ce952e669e83c8c8b5d49d510f9d3ed8; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:10840064:767e046a013f0da1c618084ffa254abbdfdcc051 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery cf1b2200ce952e669e83c8c8b5d49d510f9d3ed8 13588480 767e046a013f0da1c618084ffa254abbdfdcc051:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
