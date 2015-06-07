#!/usr/bin/ruby
###
# ENV_ID: between 10 and 99
# ENV_MOD: 0 - PROD MIN ; 1 - PROD ; 2 - DEV
# VB_CPU_BIT: 32 - 32bit i368 ; 64 - 64bit x86_64 architecture
####

ENV_ID = 22
ENV_MOD = 1
ENV_NAME = "web.lo"

VB_MEMORY = 512
VB_CPU = 2
VB_CPU_BIT = 64
VB_SATA = true

MOUNT_WWW_PATH = "../../../www_web"