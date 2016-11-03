#!/bin/bash

emacsclient.sh --eval "(progn (require 'ediff) (ediff-files \"$1\" \"$2\"))"
