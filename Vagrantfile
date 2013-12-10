Vagrant.configure("2") do |config|
  # Use Ubunute 13.04 (64bit)
  config.vm.box = "raring64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"
  # Forward Vagrant port 8000 -> to ours.
  config.vm.network :forwarded_port, guest: 8000, host: 8000

  config.ssh.forward_agent = true
  config.vm.network :private_network, ip: "33.33.33.10"

  # For masterless, mount your salt file root
  config.vm.synced_folder ".provisioner/", "/srv/", :nfs => true

  # Use salt as our provisioner.
  config.vm.provision :salt do |salt|
    salt.minion_config = ".provisioner/minion"
    salt.run_highstate = true
    salt.verbose = true
  end

  # Limit the memory on the virtual machine.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end
end