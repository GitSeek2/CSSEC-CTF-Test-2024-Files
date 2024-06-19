#!/bin/bash

# 删除自己
rm -f /flag.sh

if [ -z "$GZCTF_FLAG" ]; then
    export GZCTF_FLAG="flag{this_is_a_test_flag}"
fi

# 将 GZCTF_FLAG 注入到 /flag
echo $GZCTF_FLAG > /flag

# 清空环境变量
unset GZCTF_FLAG