#include <unistd.h> 
#include <stdio.h> 

int main(){
    printf("The real user ID is %d\n", getuid());
    printf("The real group ID is %d\n", getgid());
}
