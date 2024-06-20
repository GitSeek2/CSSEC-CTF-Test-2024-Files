#!/bin/sh
rm -f $0
if [ "$GZCTF_FLAG" = "" ]; then
    GZCTF_FLAG="Sonder{010010111100101010011010101}";
fi

echo $GZCTF_FLAG >> /home/ctf/flag
# 将变量清空
unset GZCTF_FLAG
# DO NOT DELETE
/etc/init.d/xinetd start;
sleep infinity;
