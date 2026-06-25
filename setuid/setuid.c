#include <unistd.h>
#include <stdio.h> 

int main(){
    char *argv[]={"/bin/sh",NULL};
    setuid(0);
    execve(argv[0],argv,NULL);
}
