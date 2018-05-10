#!/usr/bin/bash

emacsclient.sh --eval "(progn (require 'dired)
                (dired \"$(pwd)\")
                (local-set-key (kbd \"C-x C-c\")
                   (lambda ()
                       (interactive)
                        (kill-this-buffer)
                        (save-buffers-kill-terminal 't))))"
