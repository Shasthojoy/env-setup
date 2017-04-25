%w(
zsh
libnotify-bin
tmux
xsel
lv
pv
unar
terminator
).each do |pkg|
  package pkg do
    user 'root'
  end
end

# clang-format
# libboost-all-dev
# llvm
