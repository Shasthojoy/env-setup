URL = "https://github.com/BoostIO/boost-releases/releases/download/v0.7.5/boostnote_0.7.5_amd64.deb"

execute "wget #{URL}" do
    cwd '/tmp'
end

execute "dpkg --install boostnote_0.7.5_amd64.deb" do
    cwd '/tmp'
    user 'root'
end
