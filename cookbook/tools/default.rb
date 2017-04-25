case node[:platform]
when 'darwin'
    include_recipe 'mac.rb'
    package "grep --with-default-names"
    package 'gnu-tar --with-default-names'
when 'debian'
when 'ubuntu'
    include_recipe 'debian.rb'
else
    p "not supported"
    return
end
