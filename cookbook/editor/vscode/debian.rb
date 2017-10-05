execute 'prepare apt list' do
    command "echo 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' > /etc/apt/sources.list.d/vscode.list"
    user 'root'
    not_if "test -f /etc/apt/sources.list.d/vscode.list"
end

execute 'prepare gpg1' do
    command "curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg"
    cwd '/tmp'
    not_if 'test -f /etc/apt/trusted.gpg.d/microsoft.gpg'
end

execute 'prepare gpg2' do
    command "mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg"
    user 'root'
    cwd '/tmp'
    not_if 'test -f /etc/apt/trusted.gpg.d/microsoft.gpg'
end

execute 'apt update' do
    user 'root'
end

package 'code' do
    user 'root'
end
