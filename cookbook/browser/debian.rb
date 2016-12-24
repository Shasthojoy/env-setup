[
'libxss1',
'libappindicator1',
'libindicator7',
'gconf2-common',
'libgconf-2-4',
'libnspr4',
'libnss3',
'libpango1.0-0',
'fonts-liberation',
'xdg-utils',
'gconf-service',
].each do |pkg|
    package pkg do
        user 'root'
        not_if File.exists?('/usr/bin/google-chrome')
    end
end

[
'wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb',
'dpkg -i google-chrome*.deb',
].each do |command|
    execute command do
        cwd "#{node[:chrome][:src]}"
        user 'root'
        not_if File.exists?('/usr/bin/google-chrome')
    end
end
