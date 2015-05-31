# -*- mode: ruby -*-
# vi: set ft=ruby :

BASH_TASKS_PATH = "../bash-tasks"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :public_network
  # config.ssh.forward_agent = true

  config.vm.synced_folder "./", "/vagrant"
  config.vm.synced_folder "#{BASH_TASKS_PATH}", "/tmp/bash-tasks"

  config.vm.provider :virtualbox do |vb|
    vb.name = "cos6_64ssd"
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

    web.vm.hostname = "web.dev"
    web.vm.network :private_network, ip: "192.168.33.10"

    web.vm.synced_folder "../../www_ssd", "/var/www", :nfs => true

    web.vm.provision :shell, :path => "bash/bootstrap.sh", args: "#{BASH_TASKS_PATH}"

  end

end