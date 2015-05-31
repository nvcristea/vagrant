#!/usr/bin/ruby

VB_NAME = "centos6_web_lo"

VM_HOSTNAME = "web.lo"
VM_IP = "192.168.33.10"

MOUNT_WWW_PATH = "../../www_web"
BASH_TASKS_PATH = "../bash-tasks"
VM_BASH_TASKS_PATH = "/tmp/bash-tasks"

ENV_MODS = ["prod_min", "prod", "dev"]
BOOT_ENV = ENV_MODS[1]