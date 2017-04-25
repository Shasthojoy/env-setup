package 'jq'

execute 'download' do
    command "URL=$( curl -s \"https://api.github.com/repos/peco/peco/releases/latest\" | jq -r '.assets[] | select(.name==\"peco_linux_amd64.tar.gz\") | .browser_download_url' ) && wget $URL"
    cwd '/tmp'
end

execute 'unpack' do
    command 'tar xf peco_linux_amd64.tar.gz'
    cwd '/tmp'
end

execute 'install' do
    command 'mv peco_linux_amd64/peco /usr/local/bin'
    cwd '/tmp'
    user 'root'
end
