#!/bin/bash
VUE_APP=../../vue-app
BACKEND=../../backend
UPDATE_PATH=$PWD
CREATE_UPDATE=../src/bin/create_update

echo "Cleaning up"
rm -rf tmp_update
rm *.tar

cd $UPDATE_PATH
echo "Signing with OLD KEY!"
$CREATE_UPDATE update0 update0 ~/cb/files/coderbot_old.asc

echo "Done"
