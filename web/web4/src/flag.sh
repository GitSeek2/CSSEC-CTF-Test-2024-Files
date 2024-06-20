#!/bin/bash

# 删除自己
rm -f /flag.sh

if [ -z "$GZCTF_FLAG" ]; then
    export GZCTF_FLAG="flag{this_is_a_test_flag}"
fi

# 将 /var/www/html/index.html 中的 flag{this_is_a_sample_flag} 替换为环境变量 $GZCTF_FLAG
sed -i "s/flag{this_is_a_sample_flag}/$GZCTF_FLAG/g" /var/www/html/flag.php

# 清空环境变量
unset GZCTF_FLAG
