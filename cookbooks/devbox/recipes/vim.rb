
#
# Install basic vim configuration and setup
# vundle.
#

case node[:platform] 
when 'fedora'
    package 'vim-enhanced'
when 'ubuntu'
    package 'vim'
end

package 'git'

node[:users].each do |u|
    home = "/home/#{u}"
    cookbook_file "#{home}/.vimrc" do 
        source '.vimrc'
        owner u
        group u
    end

    vimdir = "#{home}/.vim/bundle/Vundle.vim"
    %w[ .vim .vim/bundle .vim/bundle/Vundle.vim ].each do |path|
        directory "#{home}/#{path}" do 
            owner u
            group u
        end
    end

    git vimdir do 
        repository 'https://github.com/VundleVim/Vundle.vim.git'
        user u
    end 

    execute "Installing vim plugins for #{u}" do 
        command "sudo -i -u #{u} vim +PluginInstall +qall"
    end
end

