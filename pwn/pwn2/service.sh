#!/bin/bash
rm -f $0
if [ "$GZCTF_FLAG" = "" ]; then
    GZCTF_FLAG="Sonder{010010111100101010011010101}";
fi

len=${#GZCTF_FLAG}
part_len=$((len / 3))
part1=${GZCTF_FLAG:0:part_len}
part2=${GZCTF_FLAG:part_len:part_len}
part3=${GZCTF_FLAG:(2*part_len)}
echo $part1 >> /home/ctf/gift1
echo $part2 >> /home/ctf/.gift2
mkdir /home/ctf/.hidden
echo $part3 >> /home/ctf/.hidden/gift3
# 将变量清空
unset GZCTF_FLAG
# DO NOT DELETE
/etc/init.d/xinetd start;
sleep infinity;
