node.reverse_merge!(
    chrome: {
        src: '/tmp',
    },
)

case node[:platform]
when 'darwin'
    package 'Caskroom/versions/google-chrome'
when 'debian'
when 'ubuntu'
    include_recipe 'debian.rb'
else
    p "not supported"
    return
end
