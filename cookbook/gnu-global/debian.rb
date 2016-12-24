node.reverse_merge!({
    gnu_global: {
        version: '6.5.4',
        prefix: '/usr/local',
        src: '/tmp',
    }
})

version = node[:gnu_global][:version]
prefix = node[:gnu_global][:prefix]
makecore = node[:cpu][:total]

[
'curl',
'ncurses-dev'
].each do |pkg|
    package pkg do
        user 'root'
        not_if 'which global'
    end
end

execute 'clone' do
    cwd "#{node[:gnu_global][:src]}"
    command "wget -O - http://tamacom.com/global/global-#{version}.tar.gz | tar xzf -"
    not_if "test #{version} = $(global --version |grep global |awk '{print $4}')"
end

[
"./configure --prefix=#{prefix}",
"make -j#{makecore}",
'sudo make install',
].each do |command|
    execute command do
        cwd "#{node[:gnu_global][:src]}/global-#{version}"
        not_if "test #{version} = $(global --version |grep global |awk '{print $4}')"
    end
end
