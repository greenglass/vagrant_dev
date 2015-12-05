node[:users].each do |u|
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
  cookbook_file "/home/#{u}/.tmux.conf" do 
    source '.tmux.conf'
    owner u
    group u
  end
  cookbook_file "/home/#{u}/.bashrc" do
    source '.bashrc'
    owner u
    owner u
  end
end

cookbook_file '/etc/motd' do 
  source 'motd'
  mode '0644'
end

