#include <unistd.h> 
#include <fcntl.h>
#include <string.h> 
#include <stdio.h>

int main(){
    int fd = creat("flag",0644);
    if(fd < 0){
        perror("Failed to create flag");
    }

    const char *buf="My name is hwkim301\n";
    ssize_t written=write(fd,buf,strlen(buf));

    if(written < 0){
        perror("Failed writing my name\n");
    }
}
