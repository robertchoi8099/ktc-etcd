# vim: ft=sh:
# only run on rhel

#ip=$(ifconfig eth0 | awk '/inet addr:/ {print substr($2,6)}')

@test "we should be able to store a value" {
  /usr/local/bin/etcdctl set /keys/message "Hello world"
}

@test "we should be able to get a value" {
  /usr/local/bin/etcdctl get /keys/message
}

@test "we should be able to delete a key" {
  /usr/local/bin/etcdctl delete /keys/message
}
