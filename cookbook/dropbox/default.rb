case node[:platform]
when 'darwin'
    package 'Caskroom/cask/dropbox'
when 'debian'
when 'ubuntu'
    package 'nautilus-dropbox' do
        user 'root'
    end
    p 'You should run `dropbox lansync disable`'
else
    p "not supported"
    return
end
