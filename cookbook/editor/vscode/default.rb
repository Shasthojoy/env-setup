case node[:platform]
when 'darwin'
    p "not supported"
when 'debian'
when 'ubuntu'
    include_recipe "debian.rb"
else
    p "not supported"
    return
end
