#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
apt_update 'update' do
  action :update
end

apt_repository 'mongodb-org' do
    uri "http://repo.mongodb.org/apt/ubuntu"
    distribution "xenial/mongodb-org/3.2"
    components ["multiverse"]
    keyserver "hkp://keyserver.ubuntu.com:80"
    key "EA312927"
end

package 'mongodb-org' do
  action :upgrade
end

service 'mongod' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

template '/etc/mongod.conf' do # location
  source 'mongod.conf.erb'  # mongo.conf.erb source
  mode '0755'
  owner 'root'
  group 'root'
  notifies :restart, 'service[mongod]'
end

template '/lib/systemd/system/mongod.service' do
  source 'mongod.service.erb'
  mode '0600'
  owner 'root'
  group 'root'
  notifies :restart, 'service[mongod]'
end
