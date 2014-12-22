Vagrant.configure("2") do |config|
    config.vm.box = "trusty64"
    config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    config.ssh.forward_agent = true
    config.vm.synced_folder "/home/dfdeshom/code", "/home/vagrant/parsely"

    config.vm.network "private_network", ip: "10.10.10.10"

    config.vm.provider "virtualbox" do |v|
        # allow software-defined networking
        v.customize ['modifyvm', :id, '--nicpromisc1', 'allow-all']
        # limit CPU usage
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
        # 4gb of RAM
        v.memory = 4096
        # 1 vCPUs
        v.cpus = 1
        # faster networking
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
end