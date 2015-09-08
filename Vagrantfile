# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define :elastic, primary: true do |elastic|
    elastic.vm.box = "puphpet/debian75-x64"
    elastic.vm.hostname = "elastic.vagrant.vm"
    elastic.vm.provider :virtualbox do |vb|
      vb.name = "elastic"
    end
    elastic.vm.synced_folder "salt", "/srv/salt"
    elastic.vm.synced_folder "pillar", "/srv/pillar"
    elastic.vm.network :private_network, ip: "192.168.33.99"

    # vagrant issue #5973
    # https://github.com/mitchellh/vagrant/issues/5973
    elastic.vm.provision :file, source: "minion", destination: "/tmp/minion"


    # Salt configuration
    elastic.vm.provision :salt do |salt|

        salt.minion_config = "minion"
        salt.run_highstate = true
        salt.log_level = "info"
        salt.bootstrap_options = "-P -c /tmp"
        salt.colorize = true
        salt.verbose = true

    end
  end

  config.vm.define :go do |go|
    go.vm.box = "puphpet/debian75-x64"
    go.vm.hostname = "go.vagrant.vm"
    go.vm.provider :virtualbox do |v|
      v.name = "go"
    end
    go.vm.synced_folder "salt", "/srv/salt"
    go.vm.synced_folder "pillar", "/srv/pillar"
    go.vm.network :private_network, ip: "192.168.33.90"

    # vagrant issue #5973
    # https://github.com/mitchellh/vagrant/issues/5973
    go.vm.provision :file, source: "minion", destination: "/tmp/minion"


    # Salt configuration
    go.vm.provision :salt do |salt|

        salt.minion_config = "minion"
        salt.run_highstate = true
        salt.log_level = "info"
        salt.bootstrap_options = "-P -c /tmp"
        salt.colorize = true
        salt.verbose = true

    end
  end
end
  