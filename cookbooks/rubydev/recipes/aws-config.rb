node[:users].each do |u|
    directory "/home/#{u}/.aws" do 
        owner u
        group u
    end
    cookbook_file "/home/#{u}/.aws/config" do
        source 'config'
        owner u
        group u
    end
    cookbook_file "/home/#{u}/.aws/credentials" do
        source 'credentials'
        owner u
        group u
    end
    directory "/home/#{u}/src" do
        owner u
        group u
    end
    directory "/home/#{u}/bin" do
        owner u
        group u
    end
    cookbook_file "/home/#{u}/bin/diffwrap.sh" do 
        owner u
        group u
        mode 0700
    end
    directory "/home/#{u}/.subversion" do 
        owner u
        group u
    end
    cookbook_file "/home/#{u}/.subversion/config" do 
        source 'svn_config'
        owner u
        group u
    end
    cookbook_file "/home/#{u}/.tmux.conf" do 
        source '.tmux.conf'
        owner u
        group u
    end
    file "/home/#{u}/.rspec_user_name" do 
        owner u
        group u
    end
end

cookbook_file '/etc/motd' do 
    source 'motd'
    mode '0644'
end

