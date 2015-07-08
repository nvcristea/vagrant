#!/usr/bin/ruby

if File.file?('dev_conf.rb') then
    load 'dev_conf.rb'
elsif File.file?('../../../my_conf.rb')
    load '../../../my_conf.rb'
end

ENV_ID = 22 unless defined? ENV_ID
ENV_MOD = 1  unless defined? ENV_MOD
ENV_NAME = "web.lo"  unless defined? ENV_NAME
ENV_MODS = ['prod_min', 'prod', 'dev']
SYNC_TYPE = 0 unless defined? SYNC_TYPE

VB_NAME = "centos6_#{ENV_NAME}" unless defined? VB_NAME
VM_HOSTNAME = ENV_NAME unless defined? VM_HOSTNAME
VM_IP = "192.168.33.#{ENV_ID}"

VB_MEMORY = 512 unless defined? VB_MEMORY
VB_CPU = 2 unless defined? VB_CPU
VB_CPU_BIT = 64 unless defined? VB_CPU_BIT
VB_SATA = true unless defined? VB_SATA

MOUNT_WWW_PATH = "../../../www_web" unless defined? MOUNT_WWW_PATH
BASH_TASKS_PATH = "../bash-tasks" unless defined? BASH_TASKS_PATH
VM_BASH_TASKS_PATH = "/tmp/bash-tasks" unless defined? VM_BASH_TASKS_PATH

VM_SYNC_TYPE = Array.new
VM_SYNC_TYPE.push(['', ''])
VM_SYNC_TYPE.push(['smb', 'dmode=775,fmode=664'])
VM_SYNC_TYPE.push(['nfs', 'nolock'])

VM_SYNC = VM_SYNC_TYPE[SYNC_TYPE]