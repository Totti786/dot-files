#!/bin/bash

# This script takes all mkv files in the current directory and sets the filename
# (without .mkv) as its title in metadata

for mkvfile in *.mkv; do
        mkvpropedit "$mkvfile" -e info -s title="${mkvfile%.mkv}"
    done
