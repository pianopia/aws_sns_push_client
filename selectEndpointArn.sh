# ApplicationARNの設定
iOSAppARN={ your ios_application_arn on aws-sns }
AndroidAppARN={ your ios_application_arn on aws-sns }

if [ "$1" = "" ]; then

    echo "\n\033[0;31mERROR: No Token. Please type like this.\033[0;39m"
    echo "\nsh ./selectEndpointArn.sh [deviceToken] [Android or iOS]\n"

else

    if [ "$2" = "" ]; then

        echo "\n\033[0;31mERROR: No Android/iOS target. Please set no.2.\033[0;39m\n"

    elif [ "$2" = "iOS" ]; then
	
	echo "Seaching at iOS ..."
        echo "with Token of $1 ..."

	# iOSのdeviceTokenからARNの検索
	aws sns list-endpoints-by-platform-application --platform-application-arn $iOSAppARN --query "Endpoints[?contains(Attributes.Token,\`$1\`)].[EndpointArn]"

    elif [ "$2" = "Android" ]; then

        echo "Seaching at Android ..."
	echo "with Token of $1 ..."

        # AndroidのdeviceTokenからARNの検索
        aws sns list-endpoints-by-platform-application --platform-application-arn $AndroidAppARN --query "Endpoints[?contains(Attributes.Token,\`$1\`)].[EndpointArn]"

    fi

fi
