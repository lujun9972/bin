#!/bin/bash

# play mp3 using mpg123

for uri in $@
do
    mpg123 $uri || curl -L $uri |mpg123 -
done
