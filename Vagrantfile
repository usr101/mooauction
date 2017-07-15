# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty32"

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
  end

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
     sudo apt-get -y update
     sudo apt-get install -y postgresql postgresql-contrib libpq-dev 
     sudo apt-get install -y git libreadline-dev nodejs

     git clone https://github.com/rbenv/rbenv.git ~/.rbenv
     echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
     echo 'eval "$(rbenv init -)"' >> ~/.bashrc
     source ~/.bashrc

     git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
     sudo -H -u vagrant bash -i -c 'rbenv install 2.3.3'
     sudo -H -u vagrant bash -i -c 'rbenv rehash'
     sudo -H -u vagrant bash -i -c 'rbenv global 2.3.3'
     sudo -H -u vagrant bash -i -c 'gem install bundler --no-ri --no-rdoc'
     sudo -H -u vagrant bash -i -c 'rbenv rehash'

     sudo -u postgres createuser -s vagrant
     sudo -u postgres createuser -s mooauction

  SHELL

end
