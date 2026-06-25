#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h> 

int main(){

    uid_t ruid, euid, suid; 
    gid_t rgid, egid, sgid;  

    printf("Before setuid(0)\n");

    getresuid(&ruid, &euid, &suid);
    getresgid(&rgid, &egid, &sgid);

    printf("UID : %d, eUID: %d, sUID: %d\n", ruid, euid, suid);
    printf("GID : %d, eGID: %d, sGID: %d\n", rgid, egid, sgid);

    setuid(0);
    setgid(0);

    printf("After setuid(0)\n"); 

    getresuid(&ruid, &euid, &suid); 
    getresgid(&rgid, &egid, &sgid);

    printf("UID : %d, eUID: %d, sUID: %d\n", ruid, euid, suid);
    printf("GID : %d, eGID: %d, sGID: %d\n", rgid, egid, sgid);
    
    char *argv[]={"/bin/sh",NULL};
    execve(argv[0],argv,NULL);
}
