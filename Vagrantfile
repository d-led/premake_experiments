Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.synced_folder ".", "/vagrant"

  # config.vm.provider "virtualbox" do |vb|
  #   vb.memory = "1024"
  # end

  config.vm.provision "shell", privileged: true, inline: <<-SHELL
    apt-get update
    apt-get install -y build-essential
    echo cd /vagrant >> `pwd`/.profile
  SHELL
end
