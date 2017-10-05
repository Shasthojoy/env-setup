case node[:platform]
when 'darwin'
    package 'neovim/neovim/neovim'
when 'debian'
when 'ubuntu'
    p "not supported"
    return
end

execute 'pip3 install --upgrade neovim' do
    user 'root'
end
