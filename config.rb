#!/usr/bin/ruby

if File.file?('../../../my_conf.rb')
  load '../../../my_conf.rb'
end

ENV_ID = 22 unless defined? ENV_ID
ENV_MOD = 1  unless defined? ENV_MOD
ENV_NAME = "web.lo"  unless defined? ENV_NAME

VB_NAME = "centos6_#{ENV_NAME}" unless defined? VB_NAME
VM_HOSTNAME = ENV_NAME unless defined? VM_HOSTNAME
VM_IP = "192.168.33.#{ENV_ID}"

ENV_MODS = ['prod_min', 'prod', 'dev']

MOUNT_WWW_PATH = "../../../www_web" unless defined? MOUNT_WWW_PATH
BASH_TASKS_PATH = "../bash-tasks" unless defined? BASH_TASKS_PATH
VM_BASH_TASKS_PATH = "/tmp/bash-tasks" unless defined? VM_BASH_TASKS_PATH