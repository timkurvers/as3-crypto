#FLEXPATH=../../flex_sdk_4.6
FLEXPATH=../../AIRSDK_Compiler
$FLEXPATH/bin/compc -include-sources src -output deploy/as3crypto.swc -use-network=false -optimize=true -incremental=false -target-player="10.1" -static-link-runtime-shared-libraries=true -debug=false
cp deploy/as3crypto.swc deploy/as3crypto.zip
unzip -o deploy/as3crypto.zip
./azoth.exe library.swf library.swf
zip tmp.zip library.swf catalog.xml
rm -rf library.swf catalog.xml deploy/as3crypto.swc deploy/as3crypto.zip
mv tmp.zip deploy/as3crypto.swc