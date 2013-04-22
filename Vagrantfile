Vagrant::Config.run do |config|

  # Enable the Puppet provisioner, with will look in manifests
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "modules"
  end

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "lucid32"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
  config.vm.share_folder "httpdocs", "/httpdocs", "httpdocs", :owner=> 'vagrant', :group=>'vagrant', :extra => 'dmode=775,fmode=775'

  
  # Forward guest port 80 to host port 8888 and name mapping
  # config.vm.forward_port 80, 8000
  # config.vm.forward_port 22, 2222
  config.vm.forward_port 80, 8000
end
