node.reverse_merge!({
    proxy: {
        user: ""
        http_proxy: "",
        https_proxy: "",
        dns_list: "",
    }
})

file "#{node[:proxy][:user]}/.curlrc" do
    content "proxy=#{node[:proxy][:http_proxy]}"
end
