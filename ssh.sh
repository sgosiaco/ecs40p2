#! /bin/bash
ssh $USER@`ruptime -lr | grep 'pc[0-9].*up' | head -1 | awk '{print $1;}'`.cs.ucdavis.edu
