#Argument one which should be a number is $1
#Argument two which should be a file location is $2

#Decompressing and extracting the files
tar -xzf NthPrime.tgz -C $2
cd $2/NthPrime
gcc -o NthPrime main.c nth_prime.c nth_prime.h
./NthPrime $1
