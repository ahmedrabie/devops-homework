sendToLog(){
        echo "$1 variable Not Defined" 2>&1  >> /opt/env_errors.txt
}



if [ -z "${APP_NAME}" ]; then

        #echo "APP_NAME variable Not Defined" # 2>&1  >> /opt/env_errors.txt
        sendToLog APP_NAME

    else
                echo "APP_NAME defined"
fi


if [ -z "${APP_PORT}" ]; then
                #echo "APP_PORT variable Not Defined" 2>&1  >> /opt/env_errors.txt
                sendToLog APP_PORT
                    else
                                            echo "APP_PORT defined"
fi