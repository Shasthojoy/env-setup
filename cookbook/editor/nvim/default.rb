case node[:platform]
when 'darwin'
    package 'neovim/neovim/neovim'
    execute 'easy_install pip' do
    end
when 'debian'
when 'ubuntu'
    execute 'brew install neovim/neovim/neovim' do
    end
else
    p "not supported"
    return
end

execute 'pip3 install --upgrade neovim' do
    user 'root'
end
