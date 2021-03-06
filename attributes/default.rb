include_attribute 'etcd'
include_attribute 'ktc-package'

# use binary from our repo
default[:etcd][:version] = '0.3.0'
default[:etcd][:sha256] = '18be476ba59db42c573ee23fbe00f4a205830ac54f752c0d46280707603c9192'
default[:etcd][:url] = "http://#{node[:repo_host]}/prod/kt/storage/etcd-0.3.0.tgz"

# In vagrant, these attrs should be overriden to use management IP.
default[:etcd][:addr] = ipaddress
default[:etcd][:peer_addr] = ipaddress
default[:etcd][:args] = "-peer-bind-addr=#{ipaddress} -bind-addr=#{ipaddress} -cors='*'"

# process monitoring
default[:etcd][:processes] = [
  { 'name' =>  'etcd', 'shortname' =>  'etcd' }
]

return if node[:ha_disabled] == true

# can override in env
default[:etcd][:seed_node] = 'etcd01'
default[:etcd][:search_cook] = 'ktc-etcd'
