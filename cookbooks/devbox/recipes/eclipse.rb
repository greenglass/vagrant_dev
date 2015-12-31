node[:users].each do |u|

  remote_file "/tmp/eclipse.tar.gz" do
    source "http://eclipse.mirror.rafal.ca/technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz"
    owner u
    group u
  end

  home = "/home/#{u}"
  execute "Unpacking eclipse for #{u}" do
    command "tar -zxf eclipse.tar.gz -C #{home}"
    cwd "/tmp/"
  end

  execute "Changing permissions of eclipse" do
    command "sudo chmod -R 0777 eclipse"
    cwd home
  end

  execute "Change owner/group of eclipse" do
    command "sudo chown -R #{u}:#{u} eclipse"
    cwd home
  end
end
