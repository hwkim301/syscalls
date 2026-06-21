#include <unistd.h>
#include <fcntl.h>
#include <stdio.h> 

int main(){
    int fd=open("/home/hwkim301/syscalls/open/flag", O_CREAT | O_RDWR, 0644);
    if(fd<0){
        perror("Failed to open or create flag");
    }
    else {
        printf("Created file successfully\n");
    }
}

