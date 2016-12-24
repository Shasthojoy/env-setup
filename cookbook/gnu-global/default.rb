case node[:platform]
when 'darwin'
    package 'global'
when 'debian'
when 'ubuntu'
    include_recipe 'debian.rb'
else
    p "not supported"
    return
end
