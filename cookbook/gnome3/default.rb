node.reverse_merge!({
    gnome3: {
        css_path: "/etc/gtk-3.0/gtk.css",
    }
})

file '/tmp/gtk.css' do
  action :create
  not_if "test -f #{node[:gnome3][:css_path]}"
  content '
.header-bar.default-decoration {
    padding-top: 2px;
    padding-bottom: 2px;
}

.header-bar.default-decoration .button.titlebutton {
    padding-top: 2px;
    padding-bottom: 2px;
}
  '
end

execute "mv /tmp/gtk.css #{node[:gnome3][:css_path]}" do
    user 'root'
    not_if "test -f #{node[:gnome3][:css_path]}"
end
