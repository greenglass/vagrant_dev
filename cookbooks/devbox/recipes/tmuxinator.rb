node[:users].each do |u|
  directory "/home/#{u}/.tmuxinator" do
    owner u
    group u
  end

  cookbook_file "/home/#{u}/.tmuxinator/tmuxsetup.yml" do
    source 'tmuxsetup.yml'
    owner u
    group u
  end
end
