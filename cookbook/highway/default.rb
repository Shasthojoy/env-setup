node.reverse_merge!({
    highway: {
        version: 'master',
        prefix: '/usr/local',
        src: '/usr/local/src',
    }
})

[
'automake',
].each do |pkg|
    package pkg do
        user 'root'
    end
end

git_dir = "#{node[:highway][:src]}/highway"
tmp_dir = "/tmp/highway"

git tmp_dir do
    repository 'git://github.com/tkengo/highway.git'
    revision node[:highway][:version]
end

[
'./tools/build.sh',
'sudo make install',
].each do |command|
    execute command do
        cwd tmp_dir
    end
end

execute "mv /tmp/highway #{git_dir}" do
    user 'root'
end
