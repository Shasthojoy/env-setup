%w(
zsh
libnotify-bin
tmux
xsel
lv
pv
unar
terminator
git
).each do |pkg|
  package pkg do
    user 'root'
  end
end

include_recipe "git-lfs.rb"

# clang-format
# libboost-all-dev
# llvm
