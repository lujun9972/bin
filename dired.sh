#!/usr/bin/bash

emacsclient.sh --eval "(progn (require 'dired) (dired \"$(pwd)\"))"
