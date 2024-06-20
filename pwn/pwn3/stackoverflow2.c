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

int func(char *cmd){
    puts("\nYou Have already controlled it.");
    system(cmd);
    return 0;
}

int main() {
    init_func();
    char a[13] = {};
    char b[19] = {};
    puts("$ Give me invisible string, I will show it.");
    gets(a);
    printf(a);
    printf("\nMaybe I will tell you something amazing next time !");
    if(b[0]==0x10){
        func(sh);
    }
    return 0;
}
