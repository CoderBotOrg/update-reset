#!/bin/bash
VUE_APP=../../vue-app
BACKEND=../../backend
UPDATE_PATH=$PWD
CREATE_UPDATE=../src/bin/create_update

echo "Cleaning up"
rm -rf sample_update/files
rm -rf tmp_update
rm *.tar
mkdir -p sample_update/files/install/home/pi
PI_INSTALL_PATH=$UPDATE_PATH/sample_update/files/install/home/pi

echo "Copying backend"
cp $BACKEND $PI_INSTALL_PATH/coderbot -r
rm -rf $PI_INSTALL_PATH/coderbot/lib
rm -rf $PI_INSTALL_PATH/coderbot/__pycache__
rm -rf $PI_INSTALL_PATH/coderbot/lib64
rm -rf $PI_INSTALL_PATH/coderbot/.git

# TODO: generate backend metadata

echo "Building and copying frontend"
cd $VUE_APP
#npm run build
cp dist $PI_INSTALL_PATH/coderbot/ -r

cd $UPDATE_PATH
$CREATE_UPDATE sample_update sample_update ~/Downloads/coderbot.asc

echo "Done"
