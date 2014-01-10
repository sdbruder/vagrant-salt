# -*- mode: ruby -*-
# vi: set ft=ruby :

personalization = File.expand_path("../vagrant/Personalization", __FILE__)
load personalization

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
      config.cache.auto_detect = true
  end

  config.vm.box = $vm_box
  config.vm.box_url = $vm_box_url
  config.vm.network :private_network, ip: $vm_ip_address

  config.ssh.forward_agent = true

  config.vm.synced_folder "./", "/opt/my-app", :owner => "www-data", :group => "www-data"

  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", $vm_memory
    ]
  end

  config.vm.synced_folder "vagrant/salt/", "/srv/salt/"

  config.vm.provision :salt do |salt|
    salt.minion_config = "vagrant/salt/minion"
    salt.run_highstate = true
    salt.verbose = true
  end

end
