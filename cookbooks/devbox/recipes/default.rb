#
# Cookbook Name:: devbox
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
    execute 'sudo rm -rf /var/lib/apt/lists/*'
    pkg_list = node[:ubuntu_packages]
    execute 'apt-get update'
end

package pkg_list
include_recipe "devbox::users"
include_recipe "devbox::rvm"
include_recipe "devbox::vim"
include_recipe "devbox::config"
include_recipe "devbox::tmuxinator"
include_recipe "devbox::eclipse"
include_recipe "devbox::eclim"

case node[:platform]
when 'fedora'
    #
    # cleanup the previous yum shuffle
    #
    execute 'rm /usr/bin/yum'
    execute 'mv /usr/bin/yum-saved /usr/bin/yum'
    execute 'dnf remove -y yum'
end
