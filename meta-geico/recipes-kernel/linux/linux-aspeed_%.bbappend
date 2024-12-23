FILESEXTRAPATHS:prepend := "${THISDIR}/linux-aspeed:"

SRC_URI:append = " file://quartz.cfg file://quartz.dts"

do_patch:append() {
  for DTB in "${KERNEL_DEVICETREE}"; do
      DT=`basename ${DTB} .dtb`
      if [ -r "${WORKDIR}/${DT}.dts" ]; then
          cp ${WORKDIR}/${DT}.dts \
              ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/aspeed
      fi
  done
 
}

