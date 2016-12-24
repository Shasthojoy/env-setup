%w(
build-essential curl git python-setuptools ruby
).each do |pkg|
    package pkg do
        user 'root'
    end
end

execute 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"' do
end

p 'export PATH="$HOME/.linuxbrew/bin:$PATH"'
p 'export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"'
p 'export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"'
p 'export XDG_DATA_DIRS="$HOME/.linuxbrew/share:$XDG_DATA_DIRS"'
