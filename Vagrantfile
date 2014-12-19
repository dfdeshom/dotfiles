Vagrant.configure("2") do |config|
    config.vm.box = "raring64server"
    config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"
    config.ssh.forward_agent = true
    config.vm.synced_folder "/home/dfdeshom/code", "/home/vagrant/parsely"

    #config.vm.network "private_network", ip: "192.168.1.100"

    config.vm.provider "virtualbox" do |v|
        # allow software-defined networking
        v.customize ['modifyvm', :id, '--nicpromisc1', 'allow-all']
        # limit CPU usage
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
        # 4gb of RAM
        v.memory = 4096
        # 2 vCPUs
        v.cpus = 2
    end
end