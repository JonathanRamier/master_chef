# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "master"
  current_dir = File.expand_path(File.dirname(__FILE__))

  config.vbguest.auto_update = true
  config.vbguest.no_remote = true


  config.vm.define :master do |m|
    
    # Configuration network connection
    m.vm.network :private_network, ip: "172.16.20.10"
    m.vm.hostname = "MasterChef"                    # change machine name
    m.vm.boot_timeout =  2000

    # Provisionning VM
    m.vm.provision :shell, path: "upgradeSystem.sh"  # Via Shell

    m.vm.provision "chef_solo" do |cs|               # Via Chef-Solo
      # cs.custom_config_path = "Guru/solo.rb"
      cs.cookbooks_path = "Guru/cookbooks"
      cs.data_bags_path = "Guru/data_bags"
      cs.roles_path = "Guru/roles"
      cs.add_recipe "java-open-jdk"
    end


    # Shared Sync Folder 
    m.vm.synced_folder "#{current_dir}/www/", "/var/www/", create: true, :nfs => true
    

    # Define property VM
    m.vm.provider :virtualbox do |vb|
      vb.name = "master_chef"                   # change VM name
      vb.customize ["modifyvm", :id, "--memory", "780"]
    end
  end
end
