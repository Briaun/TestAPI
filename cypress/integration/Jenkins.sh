LINE_ACCESSTOKEN="mIBQ0SehKPayfJOyyrkpSLZzHusnJlYWoa2gBupeY3e"   #access_token ของไลน์ที่ได้มา
MESSAGE_STATUSPASS="[biz-config-services-api] Alpha Build PASS on build number $BUILD_NUMBER STATUS=$BUILD_STATUS!"  #ข้อความที่บอกเมื่อรัน pass
MESSAGE_STATUSFAIL="[biz-config-services-api] Alpha Build FAIL on build number $BUILD_NUMBER STATUS=$BUILD_STATUS!"  #ข้อความที่บอกเมื่อรัน fail

var=0 

if [ "$BUILD_STATUS!" -eq "Successful!" ];then #ถ้า myfail==0 แสดงว่า pass
   curl -X POST \  #method post
    https://notify-api.line.me/api/notify \
    -H "Authorization: Bearer $LINE_ACCESSTOKEN" \  #ส่วนของ headers
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "message=$MESSAGE_STATUSPASS&stickerId=114&stickerPackageId=1" 
fi

if [ "$BUILD_STATUS!" -ne "Failure!" ];then  #ถ้า myfail!=0 แสดงว่า fail
  curl -X POST \    #method post
    https://notify-api.line.me/api/notify \
    -H "Authorization: Bearer $LINE_ACCESSTOKEN" \  #ส่วนของ headers
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "message=$MESSAGE_STATUSFAIL&stickerId=3&stickerPackageId=1"
fi
