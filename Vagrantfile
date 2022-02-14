Vagrant.configure("2") do |config|
 config.vm.define "server" do |server|
   server.vm.box = "ubuntu/bionic64"
   server.vm.hostname = "server"
   server.vm.network "private_network", ip: "192.168.50.5"
   server.vm.synced_folder "./ansible","/home/vagrant/ansible"
   server.vm.provision "shell", inline: <<-SHELL
     sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
     service ssh restart
   SHELL
   server.vm.provider "virtualbox" do |vb|
                # Размер RAM памяти
                vb.customize ["modifyvm", :id, "--memory", "4048"]
	end
 end 
 config.vm.define "controlnode" do |controlnode|
   controlnode.vm.box = "ubuntu/bionic64"
   controlnode.vm.hostname = "controlnode"
   controlnode.vm.network "private_network", ip: "192.168.50.4"
   controlnode.vm.synced_folder "./ansible","/home/vagrant/ansible"
   controlnode.vm.provision "shell", path: "./install _anible.sh"
   controlnode.vm.provider "virtualbox" do |vb|
                # Размер RAM памяти
                vb.customize ["modifyvm", :id, "--memory", "2048"]
   end
 end
end

