case node[:platform]
when 'darwin'
    # include_recipe 'mac.rb'
    return
when 'debian'
when 'ubuntu'
    include_recipe 'debian.rb'
else
    p "not supported"
    return
end
