#
# Cookbook Name:: rubydev
# Recipe:: default
#

case node[:platform]
when 'fedora'
    pkg_list = node[:rh_packages]

    #
    # install yum in an attempt to provide yum --> dnf support
    # for newer versions of Redhat systems using dnf.
    #
    # Additionally, the check developed yum-dump script 
    # has issues unless yum-deprecated is used so we
    # temporarily shuffle yum binaries to allow the 
    # package resource to work 
    #
    execute 'dnf install -y yum'
    execute 'mv /usr/bin/yum /usr/bin/yum-saved'
    execute 'ln -s /usr/bin/yum-deprecated /usr/bin/yum'
when 'ubuntu'
    pkg_list = node[:ubuntu_packages]
    execute 'apt-get update'
end

package pkg_list
include_recipe "rubydev::users"
include_recipe "rubydev::rvm"
include_recipe "rubydev::vim"
include_recipe "rubydev::aws-config"
include_recipe "rubydev::tmuxinator"

case node[:platform]
when 'fedora'
    #
    # cleanup the previous yum shuffle
    #
    execute 'rm /usr/bin/yum'
    execute 'mv /usr/bin/yum-saved /usr/bin/yum'
    execute 'dnf remove -y yum'
end
