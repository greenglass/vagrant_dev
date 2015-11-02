node[:users].each do |u|
    cookbook_file "/home/#{u}/mpapis.asc" do 
        source 'mpapis.asc'
        owner u
        group u
    end
    execute "Importing RVM key for #{u}" do 
        command "sudo -i -u #{u} gpg --import /home/#{u}/mpapis.asc"
    end
    execute "Installing RVM for user #{u}" do 
        command "sudo -i -u #{u} sh -l -c \"who am i && curl -sSL https://get.rvm.io | bash -s stable\""
        user u
    end
    file "/home/#{u}/mpapis.asc" do 
        action :delete
    end
    execute "Installing basline ruby 2.2.3 for #{u}" do 
        command "sudo -i -u #{u} sh -l -c \"rvm install 2.2.3\""
    end

    case node[:platform]
    when 'fedora'
        execute "Installing rubocop for #{u}" do 
            command "sudo -i -u #{u} sh -l -c \". ~/.bashrc && . ~/.bash_profile && rvm all do gem install rubocop\""
        end
    when 'ubuntu'
        execute "Installing rubocop for #{u}" do 
            command "sudo -i -u #{u} sh -l -c \"rvm all do gem install rubocop\""
        end
    end
end
