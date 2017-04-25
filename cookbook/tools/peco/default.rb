node.reverse_merge!({
    peco: {
        peco: {
            version: "latest"
        }
    }
})

case node[:platform]
when 'darwin'
    package 'peco'
when 'debian'
when 'ubuntu'
    include_recipe 'debian.rb'
else
    p "not supported"
    return
end
