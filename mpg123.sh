#!/bin/bash

# play mp3 using mpg123

for uri in $@
do
    curl -L $uri |mpg123 - || mpg123 $uri 
done
