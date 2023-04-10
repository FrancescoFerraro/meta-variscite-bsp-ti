# Support additional firmware for bc43xx WIFI+BT modules

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRCREV_FORMAT = "linux-firmware"

BRCM_REV = "10.54.0.13"
SRC_URI[brcm_lwb.sha256sum] = "8faa105e036a9f8bffe2857f5d9f5ce539521ef8624b59069290579440228ac5"
SRC_URI[brcm_lwb5.sha256sum] = "583e2b328a185f545e1c5de55acaf3ae092cdbc791a62ff005c5559515488f7f"

MODEL_LIST = "${MACHINE}"

SRC_URI:append = " \
	https://github.com/LairdCP/Sterling-LWB-and-LWB5-Release-Packages/releases/download/LRD-REL-${BRCM_REV}/laird-lwb-fcc-firmware-${BRCM_REV}.tar.bz2;name=brcm_lwb \
	https://github.com/LairdCP/Sterling-LWB-and-LWB5-Release-Packages/releases/download/LRD-REL-${BRCM_REV}/laird-lwb5-fcc-firmware-${BRCM_REV}.tar.bz2;name=brcm_lwb5 \
"

do_install:append() {
	install -d ${D}${nonarch_base_libdir}/firmware/bcm
	install -m 0755 ${WORKDIR}/lib/firmware/brcm/* ${D}${nonarch_base_libdir}/firmware/brcm/

	for model in ${MODEL_LIST}; do
		# Add model symbolic links to brcmfmac4339
		ln -sf brcmfmac4339-sdio.txt \
			${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.variscite,${model}.txt
		ln -sf brcmfmac4339-sdio.bin \
			${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.variscite,${model}.bin

		# Add model symbolic links to brcmfmac43430
		ln -sf brcmfmac43430-sdio.txt \
			${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.variscite,${model}.txt
		ln -sf brcmfmac43430-sdio.bin \
			${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.variscite,${model}.bin
	done
}

FILES:${PN}-bcm4339 += " \
  ${nonarch_base_libdir}/firmware/brcm/BCM4335C0.hcd \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio* \
"

FILES:${PN}-bcm43430 += " \
  ${nonarch_base_libdir}/firmware/brcm/BCM43430A1.hcd \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio* \
"

