#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y libreadline-dev
sudo apt-get install -y postgresql
sudo apt-get install -y git
sudo apt-get install -y vim
sudo apt-get install -y screen 
sudo apt-get install -y libssl-dev
sudo apt-get install -y nodejs
sudo apt-get install -y postgresql-server-dev-all
sudo -u postgres createuser -s vagrant
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.bash_profile
rbenv install 2.1.2
cd /vagrant
rbenv local 2.1.2
gem install bundler
bundle install
rake db:create
rake db:migrate
