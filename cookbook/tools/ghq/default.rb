node.reverse_merge!({
    ghq: {
        ghq: {
            version: "latest"
        }
    }
})

case node[:platform]
when 'darwin'
    package 'ghq'
when 'debian'
when 'ubuntu'
    include_recipe 'debian.rb'
else
    p "not supported"
    return
end
