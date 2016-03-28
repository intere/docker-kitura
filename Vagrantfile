# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  config.vm.provider "virtualbox" do |v|
    # 2 GB RAM, 2 CPUs
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
  config.vm.box = "ubuntu-14.04-amd64-vbox"
  config.vm.provision "shell", path: "provision.sh"

  # HTTP/HTTPS
  config.vm.network "forwarded_port", guest: 80, host: 6080
  config.vm.network "forwarded_port", guest: 443, host: 6443
  config.vm.network "forwarded_port", guest: 8090, host: 6890

end
