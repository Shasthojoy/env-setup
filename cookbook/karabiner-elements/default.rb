case node[:platform]
when 'darwin'
    package 'Caskroom/cask/karabiner-elements'
when 'debian'
when 'ubuntu'
    p "not supported"
    return
end
