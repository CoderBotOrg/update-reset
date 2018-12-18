VUE_APP=../../vue-app
BACKEND=../../backend
UPDATE_PATH=$PWD

rm -rf sample_update/files
mkdir -p sample_update/files/install/home/pi

PI_INSTALL_PATH= $UPDATE_PATH/sample_update/files/install/home/pi

cd $VUE_APP
npm run build
cp dist/ $PI_INSTALL_PATH/coderbot/ -r

cd $UPDATE_PATH

