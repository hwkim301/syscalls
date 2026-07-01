#!/bin/bash 

mkfifo fifo 
echo "This is a FIFO" > fifo &
cat fifo 
