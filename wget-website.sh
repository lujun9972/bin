#!/bin/bash
#wget -r -Nc -mk $1
#wget -r -p -np -k $1
wget --mirror -p --convert-links $1
