#!/bin/bash
TARGET="virus_zipbomb_combined.zip"
time python3 ../../zipbomb --mode=quoted_overlap --template=virus_template.zip --num-files=4 --compressed-size=$((1*16*16)) > "${TARGET}"
ls -lhrt ${TARGET}
../../ratio ${TARGET}
