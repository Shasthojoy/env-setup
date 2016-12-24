case node[:platform]
when 'darwin'
    package 'Caskroom/cask/google-japanese-ime'
when 'debian'
when 'ubuntu'
    package 'ibus-mozc' do
        user 'root'
    end
else
    p "not supported"
    return
end
