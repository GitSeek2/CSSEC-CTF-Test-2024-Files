#/bin/bash

# 删除自己
rm -f /flag.sh

if [[ -f /var/www/html/db.sql ]]; then
    mysql -e "source /var/www/html/db.sql" -uroot -proot
    rm -f /var/www/html/db.sql
fi

if [ -z "$GZCTF_FLAG" ]; then
    export GZCTF_FLAG="flag{this_is_a_test_flag}"
fi

# 将环境变量 GZCTF_FLAG 插入数据库 web3 的 flag 表
mysql -e "use web3; create table if not exists flag(flag varchar(100)); insert into flag values('$GZCTF_FLAG');" -uroot -proot


# 清空环境变量
unset GZCTF_FLAG