Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
    config.vm.provider "virtualbox" do |v|
        v.memory = 4096
        v.cpus = 4
    end
    #config.vm.network  "forwarded_port", guest: 80, host: 8080
    config.vm.network  "public_network"
    #config.vm.network  "private_network", ip: "10.0.0.100"
    config.vm.synced_folder '.', '/home/vagrant/automations'
  end
  # dos2unix 