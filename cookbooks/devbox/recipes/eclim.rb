node[:users].each do |u|
  remote_file "/tmp/eclim_2.5.0.jar" do
    source 'http://sourceforge.net/projects/eclim/files/eclim/2.5.0/eclim_2.5.0.jar/download'  
    owner u
    group u
  end

  home = "/home/#{u}"
  execute "Install eclim for #{u}" do
    command "java -Dvim.files=#{home}/.vim -Declipse.home=\"#{home}/eclipse\" -jar /tmp/eclim_2.5.0.jar install"
    user u
  end
end
