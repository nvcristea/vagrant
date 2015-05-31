#!/usr/bin/ruby

if File.file?('../../../my_conf.rb')
  load '../../../my_conf.rb'
end

VB_NAME = "centos6_web_lo" unless defined? VB_NAME

VM_HOSTNAME = "web.lo" unless defined? VM_HOSTNAME
VM_IP = "192.168.33.10" unless defined? VM_IP

MOUNT_WWW_PATH = "../../../www_web" unless defined? MOUNT_WWW_PATH
BASH_TASKS_PATH = "../bash-tasks" unless defined? BASH_TASKS_PATH
VM_BASH_TASKS_PATH = "/tmp/bash-tasks" unless defined? VM_BASH_TASKS_PATH

ENV_MODS = ["prod_min", "prod", "dev"] unless defined? ENV_MODS
BOOT_ENV = ENV_MODS[1] unless defined? BOOT_ENV