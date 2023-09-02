#!/bin/bash

## Run this script RIGHT AFTER you re-create the "simple_model.pth" (like you changed the number of layers)

cp simple_model.pth ../test/compress/template.zip
cd ../test/compress
rm -rf simple_model ; unzip template.zip > /dev/null && rm -rf template.zip simple_model/data && zip -r template.zip simple_model
cd -
