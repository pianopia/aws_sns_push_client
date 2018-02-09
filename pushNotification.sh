#/bin/bash

# 環境変数の設定
#export AWS_ACCESS_KEY_ID={ your aws_key_id }
#export AWS_SECRET_ACCESS_KEY={ your aws_key }
#export AWS_DEFAULT_REGION={ your aws_region }
#export AWS_DEFAULT_OUTPUT=json

# ApplicationARNの設定
iOSAppARN={ your ios application arn of aws-sns }
AndroidAppARN={ your android application arn of aws-sns }

if [ "$1" = "" ]; then
    echo "\n\033[0;31mERROR: No TargetARN. Please type like this.\033[0;39m"
    echo "\nsh ./pushNotificate.sh [EndpointARN] [Android/iOS]\n"
else
    topicARN=$1
    if [ "$2" = "" ]; then
        echo "\n\033[0;31mERROR: No Android/iOS target. Please set no.2.\033[0;39m\n"
    elif [ "$2" = "iOS" ]; then
        echo "Published to ${iOSAppARN}${topicARN}"
        json=`cat ./payload-ios.json`
        echo "${json}"
        aws sns publish --target-arn $iOSAppARN$topicARN --message-structure json --message "${json}"
    elif [ "$2" = "Android" ]; then
        echo "Published to ${AndroidAppARN}${topicARN}"
        json=`cat ./payload-android.json`
        echo "${json}"
        aws sns publish --target-arn $AndroidAppARN$topicARN --message-structure json --message "${json}"
        #echo "\nSorry, there are not AndroidVersion.\n"
    fi
fi
