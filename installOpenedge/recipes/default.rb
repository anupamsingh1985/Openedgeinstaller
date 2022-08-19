
# Cookbook:: installOpenedge
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#
# Installing jdk for Amazon Linux

directory '/etc/testOpenedge' do
  owner 'root'
  group 'root'
  mode '777'
  action :create
end

execute 'Install-Open-JDK' do
  command node['java_install_command']
  action :run
end
template '/etc/testOpenedge/response.ini' do
  source 'response.ini.erb'
  owner 'root'
  group 'root'
  mode '777'
  variables(javapath: node['Java']['javapath'],
            path: node['Type and Destination']['path'],
            workpath: node['Type and Destination']['workpath'],
            oem_path: node['Type and Destination']['oem_path'],
            oem_workpath: node['Type and Destination']['oem_workpath']
           )
end

# execute 'Install-Open-JDK' do
#  command 'amazon-linux-extras install java-openjdk11 -y'
#  action :run
# end
# creating Directory to place the installer and responce.ini file

# Downloading the installer from the Amazon S3 Bucket
remote_file '/etc/testOpenedge/PROGRESS_OE_12.5.1_LNX_64.tar.gz' do
  source node['installer_url']
  owner 'root'
  group 'root'
  mode '777'
end

# archive_file '/etc/testOpenedge/PROGRESS_OE_12.5.1_LNX_64.tar.gz' do
#  owner 'root'
#  group 'root'
#  mode '777'
#  path '/etc/testOpenedge/PROGRESS_OE_12.5.1_LNX_64.tar.gz'
#  destination '/etc/testOpenedge'
# end

# Extracting the downloaded file

execute 'unzip PROGRESS_OE_12.5.1_LNX_64.tar.gz' do
  command 'tar -xzf /etc/testOpenedge/PROGRESS_OE_12.5.1_LNX_64.tar.gz -C /etc/testOpenedge'
  action :run
end

# Running the installer with the response.ini file.

execute 'Install Openedge' do
  command '/etc/testOpenedge/proinst -b /etc/testOpenedge/response.ini -l /etc/testOpenedge/install_oe.log'
  action :run
  cwd '/etc'
  live_stream true
end
