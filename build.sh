#FLEXPATH=../../flex_sdk_4.6
FLEXPATH=../../AIRSDK_Compiler
$FLEXPATH/bin/compc -include-sources src -output deploy/as3crypto.swc -use-network=false -optimize=true -target-player="10.1" -static-link-runtime-shared-libraries=true
