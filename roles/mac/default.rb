def absPath(mgcpath)
    books = '../../../cookbooks'
    File.expand_path(File.join(books, mgcpath), __FILE__)
end

include_recipe "#{absPath('ime')}"
include_recipe "#{absPath('karabiner-elements')}"

include_recipe "#{absPath('browser')}"
include_recipe "#{absPath('dropbox')}"

include_recipe "#{absPath('editor/nvim')}"
include_recipe "#{absPath('gnu-global')}"
include_recipe "#{absPath('tools')}"
include_recipe "#{absPath('tools/ghq')}"
include_recipe "#{absPath('tools/peco')}"
