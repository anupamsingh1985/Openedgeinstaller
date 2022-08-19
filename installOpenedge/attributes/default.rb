
# Java Path and JDK installing commnad
case node['platform_family']
when 'amazon'
    default['Java']['javapath'] = '/usr/lib/jvm/java-11-openjdk-11.0.13.0.8-1.amzn2.0.3.x86_64'
    default['java_install_command'] = 'amazon-linux-extras install java-openjdk11 -y'
when 'debian'
    default['Java']['javapath'] = '/usr/lib/jvm/java-11-openjdk-amd64'
    default['java_install_command'] = 'sudo apt-get -y install openjdk-11-jdk'
when 'rhel'
    default['Java']['javapath'] = '/usr/lib/jvm/java-11-openjdk-11.0.16.0.8-1.el7_9.x86_64'
    default['java_install_command'] = 'yum -y install java-11-openjdk java-11-openjdk-devel'
end
# URL for the installer 

default['installer_url']= 'https://openedge-anupam.s3.us-west-2.amazonaws.com/PROGRESS_OE_12.5.1_LNX_64.tar.gz'



# installation Path and Working Dir

default['Type and Destination']['path'] = '/usr/dlc'
default['Type and Destination']['workpath'] = '/usr/wrk'
default['Type and Destination']['oem_path'] = '/usr/oemgmt'
default['Type and Destination']['oem_workpath'] = '/usr/wrk_oemgmt'
