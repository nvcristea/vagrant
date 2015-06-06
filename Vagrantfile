# -*- mode: ruby -*-
# vi: set ft=ruby :

require './config.rb'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.network :forwarded_port, guest: 22, host: "22#{ENV_ID}", id: 'ssh'
  config.vm.network :forwarded_port, guest: 80, host: "80#{ENV_ID}"
  # config.vm.network :public_network
  # config.ssh.forward_agent = true

  config.vm.synced_folder "./", "/vagrant"
  config.vm.synced_folder "#{BASH_TASKS_PATH}", "#{VM_BASH_TASKS_PATH}"
  config.vm.synced_folder "#{MOUNT_WWW_PATH}", "/var/www/web", :nfs => true, :mount_options => ['nolock']

  config.vm.provider :virtualbox do |vb|
    vb.name = "#{VB_NAME}"
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "1280"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ['storageattach', :id, '--storagectl', 'SATA',
                    '--port', '0', '--nonrotational', 'on']
  end

  config.vm.define "web.lo" do |web|

    web.vm.box = "centos65-x86_64"
    web.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"

    web.vm.hostname="#{VM_HOSTNAME}"
    web.vm.network :private_network, ip: "#{VM_IP}"
    web.vm.provision :shell, :path => "bash/bootstrap.sh", :args => ["#{ENV_MODS[ENV_MOD]}", "#{VM_BASH_TASKS_PATH}"]

  end

end