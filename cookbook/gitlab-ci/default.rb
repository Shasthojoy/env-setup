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

execute cmd do
    not_if "test -e /etc/apt/sources.list.d/runner_gitlab-ci-multi-runner.list"
end

package 'gitlab-ci-multi-runner' do
    user 'root'
end

param = node[:gitlab_ci]
regst_cmd = "gitlab-runner register --non-interactive --url #{param[:url]} --registration-token #{param[:token]} --executor #{param[:executor]} --tag-list \"#{param[:tags]}\" --run-untagged #{param[:untagged_jobs]} --locked #{param[:lock_current_proj]}"
execute regst_cmd do
    user 'root'
end
