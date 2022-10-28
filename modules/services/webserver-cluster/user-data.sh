#!/bin/bash

cat > index.html <<EOF
<h1>Hello, World</h1>
<p>DB address: ${mysql_address}</p>
<p>DB port: ${mysql_port}</p>
<h1>🎉😎👏</h1>
EOF

nohup busybox httpd -f -p ${server_port} &