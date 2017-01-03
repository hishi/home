# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # common settings
  config.vm.synced_folder "w:\\Dev", "/vagrant"
  config.ssh.forward_x11 = true
  #

  config.vm.define :hishi do |node|
    node.vm.box = "centos66"
    node.vm.host_name = "hishi"
    node.vm.network :forwarded_port, guest:22, host:21011, id:"ssh"
    node.vm.network :private_network, ip:"10.1.0.11"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 512
    end
    config.ssh.username = "hishi"
#    #config.ssh.host = "127.0.0.1"
#    #config.ssh.private_key_path = "~/.ssh/id_rsa"
  end

# for zfs simulator
# 10.1.0.12

  config.vm.define :ora12c do |node|
    node.vm.box = "centos66"
    node.vm.host_name = "ora12c"
    node.vm.network :forwarded_port, guest:22, host:21013, id:"ssh"
    node.vm.network :private_network, ip:"10.1.0.13"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 8192
    end
  end

  config.vm.define :ora12cm do |node|
    node.vm.box = "centos66"
    node.vm.host_name = "ora12cm"
    node.vm.network :forwarded_port, guest:22, host:21014, id:"ssh"
    node.vm.network :private_network, ip:"10.1.0.14"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 8192
    end
  end

# for centos72 base
# 10.1.0.15

  config.vm.define :ora11gr2 do |node|
    node.vm.box = "centos72"
    node.vm.host_name = "ora11gr2"
    node.vm.network :forwarded_port, guest:22, host:21016, id:"ssh"
    node.vm.network :private_network, ip:"10.1.0.16"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 4096
    end
  end

  config.vm.define :hishi7 do |node|
    node.vm.box = "centos72"
    node.vm.host_name = "hishi7"
    node.vm.network :forwarded_port, guest:22, host:21017, id:"ssh"
    node.vm.network :forwarded_port, guest:9292, host:9292, id:"rack"
    node.vm.network :private_network, ip:"10.1.0.17"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 4096
    end
#    config.ssh.username = "hishi"
  end

  config.vm.define :pydev01 do |node|
    node.vm.box = "centos72"
    node.vm.host_name = "pydev01"
    node.vm.network :forwarded_port, guest:22, host:21018, id:"ssh"
    node.vm.network :forwarded_port, guest:8000, host:8000, id:"web"
    node.vm.network :private_network, ip:"10.1.0.18"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 4096
      vm.cpus = 2
    end
  end

end

