Vagrant.configure("2") do |config|
    config.vm.box = "trusty64"
    config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
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
        # faster networking
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

        # forward db ports
        for i in [6379, 27017]
            config.vm.network :forwarded_port, guest: i, host: i, auto_correct: true
        end            

    end
end