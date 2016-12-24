case node[:platform_version]
when '12.04'
    ver = 'precise'
when '14.04'
    ver = 'trusty'
when '15.10'
    ver = 'wily'
when '16.04'
    ver = 'xenial'
end

[
'apt-transport-https',
'ca-certificates',
].each do |pkg|
    package pkg do
        user "root"
    end
end

template '/etc/apt/sources.list.d/docker.list' do
    action :create
    path '/tmp/docker.list'
    source 'templates/docker.list.erb'
    variables(version: "#{ver}")
    not_if 'test -f /tmp/docker.list'
end

[
'apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D',
'mv /tmp/docker.list /etc/apt/sources.list.d',
'apt-get update',
].each do |command|
    execute command do
        user 'root'
        not_if 'which docker'
    end
end

package 'docker-engine' do
    user 'root'
end

execute 'groupadd docker' do
    user 'root'
    not_if 'cat /etc/group |grep -q docker'
end

execute 'usermod -aG docker $USER' do
    user 'root'
    not_if 'groups $USER |grep -q docker'
end
