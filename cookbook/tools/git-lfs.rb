execute 'prepare' do
    command "curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash"
    user 'root'
end

package 'git-lfs' do
    user 'root'
end

# already dotfile
#execute 'install' do
#    command 'git lfs install'
#end
