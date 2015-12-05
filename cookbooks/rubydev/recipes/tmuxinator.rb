package 'Install tmuxinator' do
  package_name 'tmuxinator'
end

node['users'].each do |u|
  directory '/home/#{u}/.tmuxinator' do
    action :create
  end

  cookbook_file '/home/#{u}/.tmuxinator/tmux.yml' do
    source 'tmux.yml'
  end
end
