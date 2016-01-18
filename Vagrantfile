# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
require './app/config.rb'

puts "#{VM['name']}_#{VM['hostname']} #{VM['network']['private_ip']}"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if "#{VM['forward_agent']}" == 'true'
    config.ssh.forward_agent = true
  end

  if "#{VM['network']['public']}" == 'true'
    config.vm.network :public_network
  end

  # Port Forwarding
  if "#{VM['forward_port']}" == 'true'
    VM['forwarded_port'].each do |fp_guest, fp_host|
      config.vm.network :forwarded_port, guest: "#{fp_guest}", host: "#{fp_host}"
    end
  end

  config.vm.synced_folder "#{CONF['vendor']['path']}/enkas/bash-tasks", '/tmp/bash-tasks'
  VM['sync_folders'].each do |share|
    config.vm.synced_folder share['source'], share['target'], type: "#{VM['sync_types'][share['type']][0]}", mount_options: ["#{VM['sync_types'][share['type']][1]}"]
  end

  config.vm.box = 'centos65-x86_64'
  config.vm.box_url = "#{CONF['box']['centos65-x86_64']}"

  if "#{VM['cpu_bit']}" == '32'
    config.vm.box = 'centos6-i368'
    config.vm.box_url = "#{CONF['box']['centos6-i368']}"
  end

  config.vm.provider :virtualbox do |vb|
    vb.name = "#{VM['name']}_#{VM['hostname']}"
    vb.gui = false
    vb.customize ['modifyvm', :id, '--memory', "#{VM['memory']}"]
    vb.customize ['modifyvm', :id, '--ioapic', 'on']
    vb.customize ['modifyvm', :id, '--cpus', "#{VM['cpus']}"]
    if "#{VM['ssd']}" == 'true'
      vb.customize ['storageattach', :id, '--storagectl', 'SATA',
                      '--port', '0', '--nonrotational', 'on']
    end
  end

  config.vm.define "#{VM['name']}_#{VM['hostname']}" do |web|

    web.vm.hostname="#{VM['hostname']}"
    web.vm.network :private_network, ip: "#{VM['network']['private_ip']}"
    web.vm.provision :shell, :path => 'app/bash/bootstrap.sh', :args => ["#{VM['mode']}", '/tmp/bash-tasks']

  end

end