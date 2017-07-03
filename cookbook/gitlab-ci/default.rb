case node[:platform]
when 'darwin'
    p "not supported"
    return
when 'debian'
when 'ubuntu'
    cmd = 'curl -sL https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash'
when 'redhat'
    cmd = 'curl -sL https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.rpm.sh | sudo bash'
end

package 'curl' do
    user 'root'
end

execute cmd

package 'gitlab-ci-multi-runner' do
    user 'root'
end
