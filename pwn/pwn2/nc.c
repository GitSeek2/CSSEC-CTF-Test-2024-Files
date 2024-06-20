#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

char sh[]="/bin/sh";

int init_func() {
    setvbuf(stdin,0,2,0);
    setvbuf(stdout,0,2,0);
    setvbuf(stderr,0,2,0);
    return 0;
}

int main() {
	init_func();
    puts("##############################################################################");
    puts("欢迎来到二进制世界，黑客！你已经成功入侵了系统。");
    puts("提示：系统中隐藏着三个秘密礼物等待你的发现。FLAG由其中的字符串组成！");
    puts("但是，你需要小心。系统的防御机制已经启动，你需要在被发现之前找到所有的字符串。");
    puts("##############################################################################");
	puts("");
    system(sh);
    return 0;
}
