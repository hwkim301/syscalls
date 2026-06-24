#include <unistd.h>
#include <sys/types.h> 
#include <sys/wait.h>
#include <stdio.h> 

int main(){
    pid_t pid=fork();
    if(pid==0){
        char *argv[]={"/bin/sh",NULL};
        execve(argv[0],argv,NULL);
    }
    else if (pid > 0){
        waitpid(pid,NULL,0);
    }
    else{
        perror("fork + execve failed\n");
    }
}
