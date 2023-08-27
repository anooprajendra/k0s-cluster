# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.vm.box_check_update = false
  config.vm.provider "libvirt" do |lv|
    lv.storage_pool_name = "vm"
    lv.memory = 4096
    lv.cpus   = 4
    lv.cpu_mode = "host-passthrough"
  end  

  (0..3).each do |i|
    config.vm.define "k0s-node#{i}"
  end
  config.vm.provision :ansible do |a|
    a.compatibility_mode = "2.0"
    a.playbook = "data/ansible/playbook.yaml"
  end
end
