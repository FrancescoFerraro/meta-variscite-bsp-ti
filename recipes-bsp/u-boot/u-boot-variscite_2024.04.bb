require recipes-bsp/u-boot/u-boot-ti.inc
FILESEXTRAPATHS:prepend:var-som:k3r5 := "${THISDIR}/${PN}/am62px-var-som:"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"

UBOOT_INITIAL_ENV = "u-boot-initial-env"
SRC_URI += "file://fw_env.config"

UBOOT_GIT_URI = "git://github.com/FrancescoFerraro/ti-u-boot"

BRANCH = "dev_ti-u-boot-2024.04_10.01.10.04_var01_RND-2748_am62p"
SRCREV = "aa9d53a56f3dd59474330090478a9e7995abb75b"

COMPATIBLE_MACHINE = "(am62x-var-som|am62px-var-som)"
