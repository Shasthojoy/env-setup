%w(
xsel
lv
terminator
pv
htop
unar
pandoc
libnotify-bin
clang-format
libboost-all-dev
llvm
).each do |pkg|
  package pkg do
    user 'root'
  end
end

pkgs = %(
zsh
tmux
git
git-lfs
neovim
go
peco
ghq
)
execute "brew install #{pkgs}" do
end
