#!/usr/bin/bash

emacsclient -a "" -c -n --eval "(require 'dired)" --eval "(dired \"$(pwd)\")"
