# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # common settings
  config.vm.synced_folder "w:\\Dev", "/vagrant"
  config.ssh.forward_x11 = true
  #

##
## 10.1.0.1  -  9
## 10.1.0.10 - 19 oracle database
## 10.1.0.20 - 29 oracle database
## 10.1.0.30 - 39 oracle vm

  config.vm.define :hishi do |node|
    node.vm.box = "centos72"
    node.vm.host_name = "hishi"
#    node.vm.network :forwarded_port, guest:22, host:20001, id:"ssh"
    node.vm.network :private_network, ip:"10.1.0.1"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 512
    end
#    config.ssh.username = "hishi"
  end

  config.vm.define :pydev do |node|
    node.vm.box = "centos72"
    node.vm.host_name = "pydev"
    node.vm.network :private_network, ip:"10.1.0.2"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 4096
      vm.cpus = 1
    end
#    config.ssh.username = "root"
  end

  config.vm.define :zabbix do |node|
    node.vm.box = "centos72"
    node.vm.host_name = "zabbix"
    node.vm.network :private_network, ip:"10.1.0.3"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 512
    end
#    config.ssh.username = "root"
  end

  config.vm.define :ldap do |node|
    node.vm.box = "centos72"
    node.vm.host_name = "ldap"
    node.vm.network :private_network, ip:"10.1.0.4"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 512
    end
#    config.ssh.username = "root"
  end

  config.vm.define :test do |node|
    node.vm.box = "centos72"
    node.vm.host_name = "test"
    node.vm.network :private_network, ip:"10.1.0.5"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 512
    end
#    config.ssh.username = "root"
  end

  config.vm.define :oracledb do |node|
    node.vm.box = "centos72"
    node.vm.host_name = "oracledb"
    node.vm.network :private_network, ip:"10.1.0.11"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 4096
    end
  end

  config.vm.define :rac11204n1 do |node|
    node.vm.box = "centos72"
    node.vm.host_name = "rac11204n1"
    node.vm.network :private_network, ip:"10.1.0.21"
    node.vm.network :private_network, ip:"192.168.0.21"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 4096
    end
  end

  config.vm.define :rac11204n2 do |node|
    node.vm.box = "centos72"
    node.vm.host_name = "rac11204n2"
    node.vm.network :private_network, ip:"10.1.0.22"
    node.vm.network :private_network, ip:"192.168.0.22"
    node.vm.provider "virtualbox" do |vm|
      vm.memory = 4096
    end
  end

end

