node.reverse_merge!({
    ghq: {
        ghq: {
            version: "latest"
        }
    }
})

execute 'download' do
    command "URL=$( curl -s \"https://api.github.com/repos/motemen/ghq/releases/latest\" | jq -r '.assets[] | select(.name==\"ghq_linux_amd64.zip\") | .browser_download_url' ) && wget $URL"
    cwd '/tmp'
    not_if "test -f /tmp/ghq_linux_amd64.zip"
end

execute 'unpack' do
    command 'unzip -b ghq_linux_amd64.zip'
    cwd '/tmp'
    not_if "test -f /tmp/ghq"
end

execute 'install' do
    command 'mv ghq /usr/local/bin'
    cwd '/tmp'
    user 'root'
end
